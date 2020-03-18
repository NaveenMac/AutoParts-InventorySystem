from django.contrib import admin
from django import forms
from carmaker.models import CarMaker
from carmaker.models import CarMakerModel
# Register your models here.


class CarMakerModelInline(admin.TabularInline):
    model = CarMakerModel
    

class CarMakerAdmin(admin.ModelAdmin):
    fields = ('name','shortName')
    list_display = ('name','short_name')
    inlines=[CarMakerModelInline]

    def short_name(self,obj):
        return obj.shortName

admin.site.register(CarMaker, CarMakerAdmin)
