from django.db import models
import datetime
from django.core.validators import MaxValueValidator, MinValueValidator

def currentyear():
    return datetime.date.today().year
    
def max_value_current_year(value):
    return MaxValueValidator(currentyear())(value)
    
# Create your models here.
class Maker(models.Model):
    name = models.CharField(max_length=20)
    shortName = models.CharField(max_length=10)
    added_date = models.DateTimeField('date added')
    
class ModelLine(models.Model):
    name = models.CharField(max_length=20)
    added_date = models.DateTimeField('date added')
    
class ModelYear(models.Model):
    year = models.IntegerField('year', validators=[MinValueValidator(1984), max_value_current_year])
    added_date = models.DateTimeField('date added')
    
class ModelModification(models.Model):
    name = models.CharField(max_length=100)
    added_date = models.DateTimeField('date added')
    
class ModelListing(models.Model):
    maker = models.ForeignKey(
        Maker,
        on_delete=models.CASCADE,
        related_name = 'carmaker'
    ),
    modelline = models.ForeignKey(
        ModelLine,
        on_delete = models.CASCADE,
        related_name = 'modelline'
    ),
    year = models.ForeignKey(
        ModelYear,
        on_delete = models.CASCADE,
        related_name = 'year'
    ),
    modification = models.ForeignKey(
        ModelModification,
        on_delete = models.CASCADE,
        related_name = 'modification'
    )

