from django.db import models
from django.db.models import Model
from category.models import Category
from phone_field import PhoneField
# Create your models here.

def user_directory_path(instance, filename):

  # file will be uploaded to MEDIA_ROOT / user_<id>/<filename>
  return 'user_{0}/{1}'.format(instance.user.id, filename)
  
class Brand(models.Model):
    name = models.CharField(max_length=30, help_text='Enter brand name')
    contact_name = models.CharField(max_length=30, help_text='Enter contact person name', blank=True)
    contact_number = PhoneField( help_text='Enter contact phone number',blank=True)
    description = models.TextField(max_length=1000, help_text='Enter a brief description of the brand',blank=True)
    website = models.URLField(max_length=200,blank=True, help_text='Enter brand website address')
    
    upload = models.ImageField(upload_to='assets/brands/', help_text='upload brand image')
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    
class BrandCategory(models.Model):
    brand = models.ForeignKey(
        Brand,
        on_delete = models.CASCADE
    )
    
    category = models.ForeignKey(
        Category,
        on_delete = models.CASCADE
    )
    

    
    
