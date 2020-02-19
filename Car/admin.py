from django.contrib import admin
from django import forms
from car.models import CarMaker
from car.models import CarModel
# Register your models here.

class CarMakerAdmin(admin.ModelAdmin):
    fields = ('name','shortName')
    list_display = ('name','short_name')


    def short_name(self,obj):
        return obj.shortName

class CarModelAdmin(admin.ModelAdmin):
    fields = ('view_car_maker','model','released_on','closed_on','engine','power','fuel_type','engine_type')
    list_display = ('maker_list','model','engine','power','fuel_type','engine_type')
    search_fields = ['carmaker']
    
    def view_car_maker(self,obj):
        return obj.maker.name

    def maker_list(self,obj):
        return obj.maker.name

    view_car_maker.empty_value_display = '???'

    class CustomModelChoiceField(forms.ModelChoiceField):
        def label_from_instance(self, obj):
            return obj.name

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'maker':
            return self.CustomModelChoiceField(queryset = CarMaker.objects)

            return super(CarModelAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    
admin.site.register(CarMaker, CarMakerAdmin)
admin.site.register(CarModel, CarModelAdmin)
