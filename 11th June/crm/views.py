import re
import datetime
import pandas as pd
import pycountry as py
from datetime import date

from django.contrib import messages
from crm.models import *
from django.contrib.auth.hashers import make_password
from .forms import *
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseForbidden
from django.contrib.auth import get_user_model







def adminpanel(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        is_all = request.POST.get('is_all')
        is_form = request.POST.get('is_form')
        is_report = request.POST.get('is_report')
        is_update = request.POST.get('is_update')
        
        is_customer_form = request.POST.get('is_customer_form')
        is_worksheet_form = request.POST.get('is_worksheet_form')
        is_renewal_form = request.POST.get('is_renewal_form')
        is_credential_form = request.POST.get('is_credential_form')

        is_customer_report = request.POST.get('is_customer_report')
        is_worksheet_report = request.POST.get('is_worksheet_report')
        is_renewal_report = request.POST.get('is_renewal_report')
        is_credential_report = request.POST.get('is_credential_report')

        is_customer_update = request.POST.get('is_customer_update')
        is_worksheet_update = request.POST.get('is_worksheet_update')
        is_renewal_update = request.POST.get('is_renewal_update')
        is_credential_update = request.POST.get('is_credential_update')

        try:
            User = get_user_model()
            user = User.objects.get(username=username)
            user.is_all = is_all
            user.is_form = is_form
            user.is_report = is_report
            user.is_update = is_update
            user.is_customer_form = is_customer_form
            user.is_worksheet_form = is_worksheet_form
            user.is_renewal_form = is_renewal_form
            user.is_credential_form = is_credential_form
            user.is_customer_report = is_customer_report
            user.is_worksheet_report = is_worksheet_report
            user.is_renewal_report = is_renewal_report
            user.is_credential_report = is_credential_report
            user.is_customer_update = is_customer_update
            user.is_worksheet_update = is_worksheet_update
            user.is_renewal_update = is_renewal_update
            user.is_credential_update = is_credential_update
            user.save()
            return render(request, 'crm/adminpage.html')
        except User.DoesNotExist:
            return render(request, 'crm/adminpage.html')

    else:
        User = get_user_model()
        users = User.objects.values_list('username', flat=True)
        users = list(users)
        print(users)
        return render(request, 'crm/adminpage.html', {'users': users,'status':'admin'})






































# Create your views here.

@login_required
def home(request):
    return render(request, 'crm/home.html')

"""
def login_user(request):
	if request.method == "POST":
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(request, username=username, password=password)
		if user is not None:
			login(request, user)
			return redirect('home')
                
		else:
			messages.success(request, ("There Was An Error Logging In, Try Again..."))	
			return redirect('login_user')	
	else:
		return render(request, 'crm/login_user.html')
"""

def login_user(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        

        user = authenticate(request, username=username, password=password)

        if user is not None:
            if user.is_admin:
                login(request, user)
                return redirect('adminpanel')
            elif user.is_customer:
                login(request, user)
                return redirect('home')
            else:
                messages.success(request, "Invalid login type or credentials.")
        else:
            messages.success(request, "Invalid login credentials.")

        return redirect('login_user')
    else:
        return render(request, 'crm/login_user.html')
	

def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        password = make_password(password)
        User = get_user_model()

        check_user = User.objects.filter(username=username).count()
        check_email = User.objects.filter(email=email).count()

        if(check_user > 0):
            messages.error(request, 'Username is already taken')
            return redirect('register')
        elif(check_email > 0):
            messages.error(request, 'Email is already taken')
            return redirect('register')
        else:
            User.objects.create(username=username, email=email, password=password)
            messages.success(request, 'Account created successfully, Please Sign In')
            return redirect('login_user')
    else:
        return render(request, 'crm/register.html')    
    

def logout_user(request):
	logout(request)
	messages.success(request, ("You Were Logged Out!"))
	return redirect('login_user')

@login_required
def worksheet(request):
    if request.user.is_worksheet_form or request.user.is_all:
        name = request.POST.get('cust_org')
        customer = Customer.objects.filter(cust_org=name).first()
        df1 = Customer.objects.values_list('cust_org', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        current_date = date.today()
        current_time = datetime.datetime.now()
        return render(request, 'crm/home.html', {'customer': customer,'status':'work','df1':df1,'current_date':current_date,'current_time':current_time})
    return HttpResponseForbidden("You are blocked from accessing this page.")
        
@login_required
def credentials(request):
    if request.user.is_credential_form or request.user.is_all:
        name = request.POST.get('cust_org')
        customer = Customer.objects.filter(cust_org=name).first()
        df1 = Customer.objects.values_list('cust_org', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        context={'status':'cred','customer':customer,'df1':df1}
        return render(request,'crm/home.html',context)
    return HttpResponseForbidden("You are blocked from accessing this page.")

@login_required
def renewal(request):
    if request.user.is_renewal_form or request.user.is_all:
        name = request.POST.get('cust_org')
        customer = Customer.objects.filter(cust_org=name).first()
        df1 = Customer.objects.values_list('cust_org', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        context={'status':'renewal','df1':df1,'customer':customer}
        return render(request,'crm/home.html',context)
    return HttpResponseForbidden("You are blocked from accessing this page.")

@login_required
def uploadWorksheet(request):
    cust_id=request.POST['cust_id']
    cust_name=request.POST['cust_name']
    worktype=request.POST['worktype']
    workprogress=request.POST['workprogress']
    remarks=request.POST['remarks']
    cust_org=request.POST['cust_org']
    current_date=request.POST['current_date']
    project_id = request.POST['project_id']
    work_id = request.POST['work_id']


    p = Worksheet(
        cust_id=cust_id,
        cust_name=cust_name,
        worktype=worktype,
        workprogress=workprogress,
        remarks=remarks,
        cust_org=cust_org,
        current_date=current_date,
        project_id=project_id,
        work_id=work_id
    )
    
    p.save()
    
    context = {'status':'there_is_worksheet'}

    return render(request, 'crm/home.html', {'success': True, 'context':context})
    

@login_required
def uploadCredentials(request):
    cust_id = request.POST['cust_id']
    cust_name = request.POST['cust_name']
    item = request.POST['item']
    type = request.POST['type']
    plateform = request.POST['plateform']
    username = request.POST['username']
    password = request.POST['password']
    remark = request.POST['remark']
    status = request.POST['status']
    cust_org = request.POST['cust_org']

    c = Credentials(
    cust_id = cust_id,
    cust_name = cust_name,
    item = item,
    type = type,
    plateform = plateform,
    username = username,
    password = password,
    remark = remark,
    status = status,
    cust_org = cust_org
    )

    c.save()

    context = {'status':'there_is_cred'}

    return render(request, 'crm/home.html', {'success': True, 'context':context})

@login_required
def uploadRenewal(request):
    cust_id=request.POST['cust_id']
    cust_name=request.POST['cust_name']
    cust_org = request.POST['cust_org']
    product = request.POST['product']
    rdc = request.POST['rdc']
    rde = request.POST['rde']
    remark = request.POST['remark']
    status = request.POST['status']
   
    r = Renewal(
    cust_id=cust_id,
    cust_name=cust_name,
    cust_org=cust_org,
    product = product,
    rdc = rdc,
    rde = rde,
    remark=remark,
    status=status
    )

    r.save()

    context = {'status':'there_is_renew'}

    return render(request, 'crm/home.html', {'success': True, 'context':context})

@login_required
def getworksheet(request):
    if request.user.is_worksheet_report or request.user.is_all:
        worksheet = Worksheet.objects.all()
        context={'worksheet':worksheet,'status':'wreport'}
        return render(request,'crm/home.html',context)
    return HttpResponseForbidden("You are blocked from accessing this page.")

@login_required
def getrenewal(request):
    if request.user.is_renewal_report or request.user.is_all:
        renewal = Renewal.objects.all()
        context={'renewal':renewal,'status':'rreport'}
        return render(request,'crm/home.html',context)
    return HttpResponseForbidden("You are blocked from accessing this page.")

@login_required
def getcredentials(request):
    if request.user.is_credential_report or request.user.is_all:
        credential = Credentials.objects.all()
        context={'credential':credential,'status':'ccreport'}
        return render(request,'crm/home.html',context)
    return HttpResponseForbidden("You are blocked from accessing this page.")

@login_required   
def getcustomer(request):
    if request.user.is_customer_report or request.user.is_all:
        customer = Customer.objects.all()
        context={'customer':customer,'status':'creport'}
        return render(request,'crm/home.html',context)
    return HttpResponseForbidden("You are blocked from accessing this page.")


   
@login_required   
def countrylist(request):
    country_list = [country.name for country in py.countries]
    print(country_list)

    state_list = ["Andhra Pradesh","Arunachal Pradesh ","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli","Daman and Diu","Lakshadweep","National Capital Territory of Delhi","Puducherry"]
    
    context={'status':'profile','country_list': country_list,'state_list':state_list}
    return render(request,'crm/home.html',context)



def delete_record(request):
    name = request.POST.get('cust_id')
    customer = Customer.objects.filter(cust_id=name).first()
    worksheet = Worksheet.objects.filter(cust_id=name).filter()
    dfc = Customer.objects.values_list('cust_id', flat=True)
    dfc = list(dfc)
    dfc = set(dfc) 

    dfw = Worksheet.objects.values_list('cust_id', flat=True)
    dfw = list(dfw)
    dfw = set(dfw) 
    if request.method == 'POST':
        cust_id = request.POST.get('cust_id')
        Customer.objects.filter(cust_id=cust_id).delete()
        context={'status':'delete'}
        return render(request,'crm/home.html',context) 
    else:
        return render(request,'crm/delete_records.html',{'dfc':dfc,'dfw':dfw,'customer':customer,'worksheet':worksheet}) 

from django.shortcuts import render, redirect
from django.http import HttpResponseBadRequest
from .models import Customer

def customer_update(request):
    if request.method == 'POST':
        cust_id = request.POST.get('cust_id')
        cust_name = request.POST.get('cust_name')
        cust_address = request.POST.get('cust_address')
        cust_con_per = request.POST.get('cust_con_per')
        cust_mobile = request.POST.get('cust_mobile')
        cust_tele = request.POST.get('cust_tele')
        cust_whatsapp = request.POST.get('cust_whatsapp')
        cust_email = request.POST.get('cust_email')
        cust_website = request.POST.get('cust_website')
        cust_gst = request.POST.get('cust_gst')
        cust_city = request.POST.get('cust_city')
        cust_state = request.POST.get('cust_state')
        cust_country = request.POST.get('cust_country')
        cust_pin = request.POST.get('cust_pin')
        cust_org = request.POST.get('cust_org')

        try:
            customer = Customer.objects.get(cust_id=cust_id)
            customer.cust_name = cust_name
            customer.cust_address = cust_address
            customer.cust_con_per = cust_con_per
            customer.cust_mobile = cust_mobile
            customer.cust_tele = cust_tele
            customer.cust_whatsapp = cust_whatsapp
            customer.cust_email = cust_email
            customer.cust_website = cust_website
            customer.cust_gst = cust_gst
            customer.cust_city = cust_city
            customer.cust_state = cust_state
            customer.cust_country = cust_country
            customer.cust_pin = cust_pin
            customer.cust_org = cust_org
            customer.save()

        except Customer.DoesNotExist:
            return HttpResponseBadRequest('Customer does not exist')

        return redirect('home')

    else:
        customers = Customer.objects.all()  # Retrieve all customers
        context = {'status': 'edit_customer', 'customers': customers}
        return render(request, 'crm/home.html', context)
    


def worksheet_update(request):
    if request.method == 'POST':
        cust_id = request.POST.get('cust_id')
        cust_name = request.POST.get('cust_name')
        work_id = request.POST.get('work_id')
        worktype = request.POST.get('worktype')
        workprogress = request.POST.get('workprogress')
        remarks = request.POST.get('remarks')
        current_date = request.POST.get('current_date')
        project_id = request.POST.get('project_id')
        cust_org = request.POST.get('cust_org')

        try:
            worksheet = Worksheet.objects.get(cust_id=cust_id)
            worksheet.cust_name = cust_name
            worksheet.work_id = work_id
            worksheet.worktype = worktype
            worksheet.workprogress = workprogress
            worksheet.remarks = remarks
            worksheet.current_date = current_date
            worksheet.project_id = project_id
            worksheet.cust_org = cust_org
            worksheet.save()

        except Worksheet.DoesNotExist:
            return HttpResponseBadRequest('Customer does not exist')

        return redirect('home')

    else:
        worksheets = Worksheet.objects.all()  # Retrieve all customers
        context = {'status': 'edit_worksheet', 'worksheets': worksheets}
        return render(request, 'crm/home.html', context)
    


def renewal_update(request):
    if request.method == 'POST':
        cust_id = request.POST.get('cust_id')
        cust_name = request.POST.get('cust_name')
        product = request.POST.get('product')
        rdc = request.POST.get('rdc')
        rde = request.POST.get('rde')
        remark = request.POST.get('remark')
        status = request.POST.get('status')
        cust_org = request.POST.get('cust_org')

    

        try:
            renewal = Renewal.objects.get(cust_id=cust_id)
            renewal.cust_name = cust_name
            renewal.product = product
            renewal.rdc = rdc
            renewal.rde = rde
            renewal.remark = remark
            renewal.status = status
            renewal.cust_org = cust_org
            renewal.save()

        except Renewal.DoesNotExist:
            return HttpResponseBadRequest('Customer does not exist')

        return redirect('home')

    else:
        renewals = Renewal.objects.all()  # Retrieve all customers
        context = {'status': 'edit_renewal', 'renewals': renewals}
        return render(request, 'crm/home.html', context)
    

def credential_update(request):
    if request.method == 'POST':
        cust_id = request.POST.get('cust_id')
        cust_name = request.POST.get('cust_name')
        item = request.POST.get('item')
        type = request.POST.get('type')
        plateform = request.POST.get('plateform')
        username = request.POST.get('username')
        password = request.POST.get('password')
        remark = request.POST.get('remark')
        status = request.POST.get('status')
        cust_org = request.POST.get('cust_org')

        try:
            credentials = Credentials.objects.get(cust_id=cust_id)
            credentials.cust_name = cust_name
            credentials.item = item
            credentials.type = type
            credentials.plateform = plateform
            credentials.username = username
            credentials.password = password
            credentials.remark = remark
            credentials.status = status
            credentials.cust_org = cust_org
            credentials.save()

        except Credentials.DoesNotExist:
            return HttpResponseBadRequest('Customer does not exist')

        return redirect('home')

    else:
        credentials = Credentials.objects.all()  # Retrieve all customers
        context = {'status': 'edit_credential', 'credentials': credentials}
        return render(request, 'crm/home.html', context)
    
    
def worksheetedit(request):
    if request.user.is_worksheet_update or request.user.is_all:
        name = request.POST.get('cust_id')
        worksheet = Worksheet.objects.filter(cust_id=name).first()
        df1 = Worksheet.objects.values_list('cust_id', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        current_date = date.today()
        current_time = datetime.datetime.now()
        return render(request, 'crm/home.html', {'worksheet': worksheet,'status':'workedit','df1':df1,'current_date':current_date,'current_time':current_time})
    return HttpResponseForbidden("You are blocked from accessing this page.")   

 
def customeredit(request):
    if request.user.is_customer_update or request.user.is_all:
        name = request.POST.get('cust_id')
        customer = Customer.objects.filter(cust_id=name).first()
        df1 = Customer.objects.values_list('cust_id', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        current_date = date.today()
        current_time = datetime.datetime.now()
        return render(request, 'crm/home.html', {'customer': customer,'status':'customeredit','df1':df1,'current_date':current_date,'current_time':current_time})
    return HttpResponseForbidden("You are blocked from accessing this page.")  
    

 
def renewaledit(request):
    if request.user.is_renewal_update or request.user.is_all:
        name = request.POST.get('cust_id')
        renewal = Renewal.objects.filter(cust_id=name).first()
        df1 = Renewal.objects.values_list('cust_id', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        current_date = date.today()
        current_time = datetime.datetime.now()
        return render(request, 'crm/home.html', {'renewal': renewal,'status':'renewaledit','df1':df1,'current_date':current_date,'current_time':current_time})
    return HttpResponseForbidden("You are blocked from accessing this page.")

def credentialedit(request):
    if request.user.is_credential_update or request.user.is_all:
        name = request.POST.get('cust_id')
        credential = Credentials.objects.filter(cust_id=name).first()
        df1 = Credentials.objects.values_list('cust_id', flat=True)
        df1 = list(df1)
        df1 = set(df1)
        current_date = date.today()
        current_time = datetime.datetime.now()
        return render(request, 'crm/home.html', {'credential': credential,'status':'credentialedit','df1':df1,'current_date':current_date,'current_time':current_time})
    return HttpResponseForbidden("You are blocked from accessing this page.")
    
@login_required
def customer(request):
    if request.user.is_customer_form or request.user.is_all:

        all_customer_ids = Customer.objects.values_list('cust_id', flat=True)
        all_customer_ids = list(all_customer_ids)
        last_index = all_customer_ids[-1]
        print(last_index)
        alpa_id = last_index[0:4]
        num_id = last_index[4:]
        new_id = alpa_id + num_id
        num_id = int(num_id) + 1
        print("New Num",num_id)
        print("Last Index",last_index)
        print("Alpha bet",alpa_id)
        print("Number",num_id)
        print(new_id)
        num_id = str(num_id)
        x = num_id.zfill(3)
        print("Value of X",x)
        final_id = alpa_id+x
        print("Final id",final_id)
        all_customer_ids.append(final_id)

        country_list = [country.name for country in py.countries]
        state_list = ["Andhra Pradesh","Arunachal Pradesh ","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli","Daman and Diu","Lakshadweep","National Capital Territory of Delhi","Puducherry"]
        print(state_list)
        if request.method == 'POST':
            cust_id = request.POST['cust_id']
            cust_name = request.POST['cust_name']
            cust_address = request.POST['cust_address']	
            cust_con_per = request.POST['cust_con_per']	
            cust_mobile = request.POST['cust_mobile']	
            cust_tele = request.POST['cust_tele']	
            cust_whatsapp = request.POST['cust_whatsapp']	
            cust_email = request.POST['cust_email']	
            cust_website = request.POST['cust_website']	
            cust_gst = request.POST['cust_gst']	
            cust_city = request.POST['cust_city']	
            cust_state = request.POST['cust_state']	
            cust_country = request.POST['cust_country']	
            cust_pin = request.POST['cust_pin']
            cust_org = request.POST['cust_org']


            all_customer_ids = Customer.objects.values_list('cust_id', flat=True)
            all_customer_ids = list(all_customer_ids)
            if all_customer_ids:
                last_index = all_customer_ids[-1]
            else:
                last_index = 'EGDG000' #default start index
                print(last_index)
                alpa_id = last_index[0:4]
                num_id = last_index[4:]
                new_id = alpa_id + num_id
                num_id = int(num_id) + 1
                print("New Num",num_id)
                print("Last Index",last_index)
                print("Alpha bet",alpa_id)
                print("Number",num_id)
                print(new_id)
                num_id = str(num_id)
                x = num_id.zfill(3)
                print("Value of X",x)
                final_id = alpa_id+x
                print("Final id",final_id)
                all_customer_ids.append(final_id)


            if Customer.objects.filter(cust_id=cust_id).exists():
                error_message = "Customer with this ID already exists."

            elif not re.match("^[a-zA-Z]+$", cust_name):
                error_message = "Customer name should only contain alphabets."

            elif Customer.objects.filter(cust_org=cust_org).exists():
                error_message = "Customer with this organisation already exists."
            
            elif Customer.objects.filter(cust_address=cust_address).exists():
                error_message = "Customer with this address already exists."

            elif Customer.objects.filter(cust_con_per=cust_con_per).exists():
                error_message = "Customer with this person already exists."

            elif Customer.objects.filter(cust_mobile=cust_mobile).exists():
                error_message = "Customer with this mobile already exists."

            elif Customer.objects.filter(cust_tele=cust_tele).exists():
                error_message = "Customer with this tele already exists."
            
            elif Customer.objects.filter(cust_whatsapp=cust_whatsapp).exists():
                error_message = "Customer with this whatsapp already exists."

            elif Customer.objects.filter(cust_email=cust_email).exists():
                error_message = "Customer with this email already exists."
            
            elif Customer.objects.filter(cust_website=cust_website).exists():
                error_message = "Customer with this website already exists."

            elif Customer.objects.filter(cust_gst=cust_gst).exists():
                error_message = "Customer with this gst already exists."

            elif Customer.objects.filter(cust_gst=cust_gst).exists():
                error_message = "Customer with this gst already exists."

            
            else:

            

                # No duplicates found, save the customer
                p = Customer(
                    cust_id=cust_id,
                    cust_name=cust_name,
                    cust_address = cust_address,	
                    cust_con_per = cust_con_per,
                    cust_mobile = cust_mobile,	
                    cust_tele = cust_tele,
                    cust_whatsapp = cust_whatsapp,	
                    cust_email = cust_email,
                    cust_website = cust_website,	
                    cust_gst = cust_gst,	
                    cust_city = cust_city,	
                    cust_state = cust_state,	
                    cust_country = cust_country,	
                    cust_pin = cust_pin,
                    cust_org = cust_org
                )
                p.save()

                all_customer_ids = Customer.objects.values_list('cust_id', flat=True)
                all_customer_ids = list(all_customer_ids)
                last_index = all_customer_ids[-1]
                print(last_index)
                alpa_id = last_index[0:4]
                num_id = last_index[4:]
                new_id = alpa_id + num_id
                num_id = int(num_id) + 1
                print("New Num",num_id)
                print("Last Index",last_index)
                print("Alpha bet",alpa_id)
                print("Number",num_id)
                print(new_id)
                num_id = str(num_id)
                x = num_id.zfill(3)
                print("Value of X",x)
                final_id = alpa_id+x
                print("Final id",final_id)
                all_customer_ids.append(final_id)

            

                

                context = {'status': 'there_is_profile', 'success': True,'final_id':final_id,'country_list':country_list,'state_list':state_list}
                return render(request, 'crm/home.html', context)
        
                    
            # Duplicate found, return error message
            context = {'status': 'there_is_profile', 'success': False, 'error_message': error_message}
            return render(request, 'crm/home.html', context)

        else:

            context = {'status': 'there_is_profile', 'success': False,'country_list':country_list,'state_list':state_list,'final_id':final_id}
            return render(request, 'crm/home.html', context)
        
    return HttpResponseForbidden("You are blocked from accessing this page.")





















      

    



     
