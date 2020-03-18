from django.db import models



# Create your models here.
class CarMaker(models.Model):
    name = models.CharField(max_length=20)
    shortName = models.CharField(max_length=4)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
       
    class Meta:
        verbose_name_plural = "Car Makers"


class CarMakerModel(models.Model):
    DIESEL = 'DL'
    PETROL = 'PL'
    CNG = 'CG'
    
    FUEL_TYPE_CHOICES = [
        (DIESEL, 'Diesel'),
        (PETROL, 'Petrol'),
        (CNG, 'CNG')
    ]
    
    maker = models.ForeignKey(
        CarMaker,blank=True,null=True,
        on_delete = models.CASCADE
    )
    model = models.CharField(max_length=100,blank=True)
    released_on = models.DateField(blank=True,null=True)
    closed_on = models.DateField(blank=True,null=True)
    engine = models.FloatField()
    power = models.FloatField()
    fuel_type = models.CharField(
        max_length=2,
        choices = FUEL_TYPE_CHOICES,
        default = PETROL)
    engine_type = models.CharField(max_length=50,blank=True)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
