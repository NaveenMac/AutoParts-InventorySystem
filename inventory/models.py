from django.db import models

# Create your models here.
class TechUsers(models.Model):
    username = models.CharField(max_length=20)
    pwd = models.CharField(max_length=20)
    email = models.CharField(max_length=50)
    type = models.SmallIntegerField()
    registration_date = models.DateTimeField('date created')
