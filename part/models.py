from django.db import models
from datetime import datetime

# Create your models here.

# Create your models here.
class PartCategory(models.Model):
    name = models.CharField(max_length=50)
    parent = models.ForeignKey(
           'self',
           default=None,
           null=True,
           blank=True,
           on_delete=models.CASCADE
       )
    is_class = models.BooleanField()
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
