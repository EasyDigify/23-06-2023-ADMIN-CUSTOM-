# Generated by Django 4.1.6 on 2023-06-23 12:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("admin", "0003_logentry_add_action_flag_choices"),
        ("auth", "0012_alter_user_first_name_max_length"),
        ("crm", "0001_initial"),
    ]

    operations = [
        migrations.RenameModel(
            old_name="User",
            new_name="CustomUser",
        ),
    ]
