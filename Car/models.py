from django.db import models
import datetime
from django.core.validators import MaxValueValidator, MinValueValidator

def currentyear():
    return datetime.date.today().year
    
def max_value_current_year(value):
    return MaxValueValidator(currentyear())(value)
    
# Create your models here.
class CarMaker(models.Model):
    name = models.CharField(max_length=20)
    shortName = models.CharField(max_length=10)
    added_date = models.DateTimeField('date added')
class CarList(models.Model):
    maker = models.ForeignKey(
        CarMaker,
        on_delete = models.CASCADE
    )
    modelline = models.CharField(max_length=20)
    year = models.IntegerField('year', validators=[MinValueValidator(1984), max_value_current_year])
    modifications = models.CharField(max_length=100,default='')
    

    
