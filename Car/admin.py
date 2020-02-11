from django.contrib import admin
from Car.models import CarMaker
from Car.models import CarList
# Register your models here.

class CarMakerAdmin(admin.ModelAdmin):
    fields = ('name','shortName')
    list_display = ('name','short_name')
    list_filter = ('name',)
    
    def short_name(self,obj):
        return obj.shortName
        
    
class CarListAdmin(admin.ModelAdmin):
    pass
    
admin.site.register(CarMaker, CarMakerAdmin)
admin.site.register(CarList, CarListAdmin)
