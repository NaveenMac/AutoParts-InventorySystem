from django.contrib import admin
from Car.models import Maker
from Car.models import ModelLine
from Car.models import ModelYear
from Car.models import ModelLine
from Car.models import ModelListing
# Register your models here.

admin.site.register(Maker)
admin.site.register(ModelLine)
admin.site.register(ModelYear)
admin.site.register(ModelListing)
