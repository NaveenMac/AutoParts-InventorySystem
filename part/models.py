from django.db import models
from django.db.models import Model
from djrichtextfield.models import RichTextField

from datetime import datetime
from brand.models import Brand
from category.models import Category

from django.template.defaultfilters import slugify


    
    
class AutoPart(models.Model):
    part_title = models.CharField(max_length=70)
    part_number = models.CharField(max_length=100)
    
    feature = RichTextField()
    description = models.TextField(max_length=1000, help_text='Enter a brief description of the part',blank=True)

class AutoPartCategory(models.Model):
    autopart = models.ForeignKey(
        AutoPart,blank=True,null=True,
        on_delete = models.CASCADE
    )

    category = models.ForeignKey(
        Category,
        on_delete = models.CASCADE
    )

class AutoPartBrand(models.Model):
    autopart = models.OneToOneField(
        AutoPart,
        on_delete = models.CASCADE
    )

    brand = models.ForeignKey(
        Brand,
        on_delete = models.CASCADE
    )


def get_image_path(instance, filename):
    autopart_number = instance.autopart.part_number
    slug = slugify(autopart_number)
    return "autopart/%s/%s" % (slug, slugify(filename))


class AutoPartPicture(models.Model):
    autopart = models.ForeignKey(AutoPart,on_delete = models.CASCADE)
    image = models.ImageField(upload_to=get_image_path, help_text='upload autopart image')
