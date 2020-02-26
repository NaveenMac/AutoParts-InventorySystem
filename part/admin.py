from django.contrib import admin
from part.models import Category

from django import forms
# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    fields = ['name','parent','is_class']
    list_display = ('name','list_parent','is_class','created_on')
    
    def list_parent(self,obj):
        if obj.parent:
            return obj.parent.name
        else:
            return '--'
   
    
      
    class CustomModelChoiceField(forms.ModelChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'parent':
            return self.CustomModelChoiceField(queryset = Category.objects)

            return super(CategoryAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
            
admin.site.register(Category, CategoryAdmin)
