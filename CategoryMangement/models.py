from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=255)
    shortName = models.CharField(max_length=10)
    
class SubCategory(models.Model):
    category = models.ForeignKey(Category, on_delete = models.CASCADE)
    name = models.CharField(max_length=100)
    description = models.CharField(,max_length=255)
    shortName = models.CharField(max_length=10)
