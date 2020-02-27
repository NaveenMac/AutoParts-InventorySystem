from django.contrib import admin
from part.models import AutoPart
from part.models import AutoPartCategory

# Register your models here.

class AutoPartCategoryInline(admin.StackedInline):
    model = AutoPartCategory
    
class AutoPartAdmin(admin.ModelAdmin):
    fields = ['part_title','part_number','description','feature']
    
    list_display = ('part_title','part_number')
    inlines = [AutoPartCategoryInline]
    
            
admin.site.register(AutoPart, AutoPartAdmin)
