from django.contrib import admin
from django import forms
from Car.models import CarMaker
from Car.models import CarModelline

# Register your models here.

class CarMakerAdmin(admin.ModelAdmin):
    fields = ('name','shortName','added_date')
    list_display = ('name','short_name')
    
    
    def short_name(self,obj):
        return obj.shortName
        
    
class CarModellineAdmin(admin.ModelAdmin):
    fields = ('maker','modelline','year','modification','added_date')
    list_display = ('maker_list','modelline','year','modification')
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

            return super(CarListAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    
admin.site.register(CarMaker, CarMakerAdmin)
admin.site.register(CarModelline, CarModellineAdmin)
