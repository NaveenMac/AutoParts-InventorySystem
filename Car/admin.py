from django.contrib import admin
from Car.models import CarMaker
from Car.models import CarList
# Register your models here.

class CarMakerAdmin(admin.ModelAdmin):
    fields = ('name','shortName')
    list_display = ('name','short_name')
    
    
    def short_name(self,obj):
        return obj.shortName
        
    
class CarListAdmin(admin.ModelAdmin):
    fields = ('maker','modelline','year','modifications')
    list_display = ('maker_list','modelline','year','modifications')
    search_fields = ['carmaker']
    def view_car_maker(self,obj):
        return obj.maker.name
        
    def maker_list(self,obj):
        return obj.maker.name
    
    view_car_maker.empty_value_display = '???'
admin.site.register(CarMaker, CarMakerAdmin)
admin.site.register(CarList, CarListAdmin)
