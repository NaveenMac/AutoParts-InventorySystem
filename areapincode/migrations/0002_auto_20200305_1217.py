# Generated by Django 3.0.2 on 2020-03-05 12:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('part', '0027_auto_20200305_1137'),
        ('areapincode', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='AreaPincodeModel',
            new_name='AreaPincode',
        ),
    ]
