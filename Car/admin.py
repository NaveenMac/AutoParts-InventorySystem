from django.contrib import admin
from Car.models import CarMaker

from Car.models import CarList
# Register your models here.

admin.site.register(CarMaker)
admin.site.register(CarList)
