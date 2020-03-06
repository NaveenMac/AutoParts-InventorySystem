from django.db import models
from django.db.models import Model

# Create your models here.
class AreaPincode(models.Model):
    pincode = models.IntegerField()
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name_plural = "Delivery Pincodes"
