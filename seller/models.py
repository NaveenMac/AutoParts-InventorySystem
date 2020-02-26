from django.db import models
from django.db.models import Model
from category.models import Category
from phone_field import PhoneField

# Create your models here.
class Seller(models.Model):
    name = models.CharField(max_length=30, help_text='Enter seller name')
    contact_name = models.CharField(max_length=30, help_text='Enter contact person name', blank=True)
    contact_number = PhoneField( help_text='Enter contact phone number',blank=True)
    description = models.TextField(max_length=1000, help_text='Enter a brief description of the seller',blank=True)
    website = models.URLField(max_length=200,blank=True, help_text='Enter seller website address')
    
    upload = models.ImageField(upload_to='assets/seller/', help_text='upload seller image')
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    
class SellerCategory(models.Model):
    seller = models.ForeignKey(
        Seller,
        on_delete = models.CASCADE
    )
    
    category = models.ForeignKey(
        Category,
        on_delete = models.CASCADE
    )
    
