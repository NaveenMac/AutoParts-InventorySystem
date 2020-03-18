from django.contrib.auth.models import AbstractUser
from django.db import models
from seller.models import Seller

class Role(models.Model):
    TECH_USER = 1
    MAINTAINER = 2
    SECRETARY = 3
    SUPERVISOR = 4
    ADMIN = 5

    ROLE_CHOICES = (
        (TECH_USER, 'tech user'),
        (MAINTAINER, 'maintainer'),
        (SECRETARY, 'secretary'),
        (SUPERVISOR, 'supervisor'),
        (ADMIN, 'admin'),
    )
    
    id = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, primary_key=True)
    
    def __str__(self):
        return self.get_id_display()
    
    
class User(AbstractUser):
    roles = models.ManyToManyField(Role)
    seller = models.ForeignKey(Seller,on_delete=models.SET_NULL, null=True)


