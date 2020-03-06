from django.db import models
from django.db.models import Model
from djrichtextfield.models import RichTextField

from datetime import datetime
from brand.models import Brand
from seller.models import Seller
from category.models import Category
from areapincode.models import AreaPincode
from car.models import CarMaker
from car.models import CarModel
from django.template.defaultfilters import slugify


    
    
class AutoPart(models.Model):
    OEM = 'OM'
    AFTERMARKET = 'AM'
    
    
    ORIGIN_TYPE_CHOICES = [
                         (OEM, 'OEM'),
                         (AFTERMARKET, 'AfterMarket'),
                         ]
                         
    part_title = models.CharField(max_length=70)
    part_number = models.CharField(max_length=100)
    origin = models.CharField(
                                 max_length=2,
                                 choices = ORIGIN_TYPE_CHOICES,
                                 default = OEM)
    feature = RichTextField()
    description = models.TextField(max_length=1000, help_text='Enter a brief description of the part',blank=True)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name_plural = "Auto Parts"
    

class AutoPartCategory(models.Model):
    autopart = models.OneToOneField(
        AutoPart,
        on_delete = models.CASCADE
    )

    category = models.ManyToManyField(
        Category
    )

class AutoPartBrand(models.Model):
    autopart = models.OneToOneField(
        AutoPart,
        on_delete = models.CASCADE
    )

    brand = models.ManyToManyField(
        Brand
    )
    


class AutoPartSeller(models.Model):
    autopart = models.ForeignKey(
            AutoPart,
            on_delete = models.CASCADE
            )
    
    seller = models.ForeignKey(Seller,blank=True, null=True, on_delete = models.CASCADE)
    availability = models.ManyToManyField(AreaPincode)
    unit_price = models.FloatField(default=0)
    in_stock = models.PositiveIntegerField(default=0)
    out_stock = models.PositiveIntegerField(default=0)
    stock_in_process = models.PositiveIntegerField(default=0)
    
class AutoPartCompatibility(models.Model):
    autopart = models.ForeignKey(
            AutoPart,
            on_delete = models.CASCADE
            )

    carmaker = models.ForeignKey(CarMaker,blank=True, null=True, on_delete = models.CASCADE)
    carmodel = models.ManyToManyField(CarModel)
    

def get_image_path(instance, filename):
    autopart_number = instance.autopart.part_number
    slug = slugify(autopart_number)
    return "assets/part/%s/%s" % (slug, slugify(filename))


class AutoPartPicture(models.Model):
    autopart = models.ForeignKey(AutoPart,on_delete = models.CASCADE)
    image = models.ImageField(upload_to=get_image_path, help_text='upload autopart image')
