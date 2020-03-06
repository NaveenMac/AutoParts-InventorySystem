from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=50)
    parent = models.ForeignKey('self',blank=True,null=True,on_delete=models.CASCADE)
    is_class = models.BooleanField()
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name_plural = "Categories"
