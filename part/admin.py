from django.contrib import admin
from part.models import AutoPart

from django import forms
# Register your models here.

class AutoPartAdmin(admin.ModelAdmin):
    fields = ['part_title','part_number','description','feature']
    list_display = ('part_title','part_number')
    
    
            
admin.site.register(AutoPart, AutoPartAdmin)
