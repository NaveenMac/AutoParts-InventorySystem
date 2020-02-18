from django.db import models
import datetime
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.timezone import now
def currentyear():
    return datetime.date.today().year
    
def max_value_current_year(value):
    return MaxValueValidator(currentyear())(value)
    
# Create your models here.
class CarMaker(models.Model):
    name = models.CharField(max_length=20)
    shortName = models.CharField(max_length=10)
    added_date = models.DateTimeField(auto_now_add=True, blank=True, editable=False)
    

class CarModel(models.Model):
    maker = models.ForeignKey(
        CarMaker,
        on_delete = models.CASCADE
    )
    model = models.CharField(max_length=100,default='-')
    release_date = models.DateTimeField('date released')
    closing_date = models.DateTimeField('date closed)
    engine = models.FloatField()
    power = models.FloatField()
    fuel_type = EnumField(choices=['Diesel', 'Petrol', 'CNG'])
    engine_type = models.CharField(max_length=50,default='-')
    added_date = models.DateTimeField(auto_now_add=True, blank=True, editable=False)
    

    

    
