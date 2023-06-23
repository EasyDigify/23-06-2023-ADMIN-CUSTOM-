from django.db import models
from django.contrib.auth.models import AbstractUser
from phonenumber_field.modelfields import PhoneNumberField
from phonenumber_field.phonenumber import PhoneNumber
from django.core.validators import EmailValidator


class User(AbstractUser):

    is_all = models.BooleanField(default=False)
    is_form = models.BooleanField(default=False)  #parent group
    is_report = models.BooleanField(default=False) #create group
    is_update = models.BooleanField(default=False) #report group
    is_customer_form = models.BooleanField(default=False) #customer group
    is_worksheet_form = models.BooleanField(default=False) #worksheet group
    is_renewal_form = models.BooleanField(default=False) #renewal group
    is_credential_form = models.BooleanField(default=False) #credential group
    is_customer_report = models.BooleanField(default=False) #customer group
    is_worksheet_report = models.BooleanField(default=False) #worksheet group
    is_renewal_report = models.BooleanField(default=False) #renewal group
    is_credential_report = models.BooleanField(default=False) #credential group
    is_customer_update = models.BooleanField(default=False) #customer group
    is_worksheet_update = models.BooleanField(default=False) #worksheet group
    is_renewal_update = models.BooleanField(default=False) #renewal group
    is_credential_update = models.BooleanField(default=False) #credential group

    is_admin = models.BooleanField(default=False)
    is_customer = models.BooleanField(default=False)
    
    
   


class Customer(models.Model):
    cust_id = models.CharField(max_length=254,default="")
    cust_name = models.CharField(max_length=254,default="")
    cust_address = models.CharField(max_length=254,default="")	
    cust_con_per = models.CharField(max_length=254,default="")	
    cust_mobile = PhoneNumberField()
    cust_tele = PhoneNumberField()
    cust_whatsapp = PhoneNumberField()	
    cust_email = models.EmailField(validators=[EmailValidator()])
    cust_website = models.CharField(max_length=254,default="")	
    cust_gst = models.CharField(max_length=254,default="")	
    cust_city = models.CharField(max_length=254,default="")	
    cust_state = models.CharField(max_length=254,default="")	
    cust_country = models.CharField(max_length=254,default="")	
    cust_pin = models.IntegerField()	
    cust_org = models.CharField(max_length=254,default="")


class Worksheet(models.Model):
    cust_id = models.CharField(max_length=254,default="")
    work_id = models.CharField(max_length=254,default="")
    cust_name = models.CharField(max_length=254,default="")
    worktype = models.CharField(max_length=254,default="")
    workprogress = models.CharField(max_length=254,default="")
    remarks = models.CharField(max_length=50,default="")
    cust_org = models.CharField(max_length=254,default="")
    current_date = models.DateField()
    project_id = models.CharField(max_length=254,default="")


   


class Credentials(models.Model):
    cust_id = models.CharField(max_length=254,default="")
    cust_name = models.CharField(max_length=254,default="")
    item = models.CharField(max_length=254,default="")
    type = models.CharField(max_length=254,default="")
    plateform = models.CharField(max_length=254,default="")
    username = models.CharField(max_length=254,default="")
    password = models.CharField(max_length=254,default="")
    remark = models.CharField(max_length=254,default="")
    status = models.CharField(max_length=254,default="")
    cust_org = models.CharField(max_length=254,default="")


class Renewal(models.Model):
    cust_id = models.CharField(max_length=254,default="")
    cust_name = models.CharField(max_length=254,default="")
    cust_org = models.CharField(max_length=254,default="")
    product = models.CharField(max_length=254,default="")
    rdc = models.DateField()
    rde = models.DateField()
    remark = models.CharField(max_length=254,default="")
    status = models.CharField(max_length=254,default="")
    








    
    
