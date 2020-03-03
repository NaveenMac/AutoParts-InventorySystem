from django.contrib import admin
from django import forms
from part.models import AutoPart
from part.models import AutoPartPicture
from part.models import AutoPartCategory
from part.models import AutoPartBrand
from category.models import Category
from brand.models import Brand

# Register your models here.

class AutoPartPictureInline(admin.TabularInline):
    model = AutoPartPicture

class AutoPartCategoryInline(admin.TabularInline):
    model = AutoPartCategory
    class CustomModelChoiceField(forms.ModelChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        
        if db_field.name == 'category':
            return self.CustomModelChoiceField(queryset = Category.objects)
            
            return super(CategoryAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class AutoPartBrandInline(admin.TabularInline):
    model = AutoPartBrand
    class CustomModelChoiceField(forms.ModelChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        
        if db_field.name == 'brand':
            return self.CustomModelChoiceField(queryset = Brand.objects)
            
            return super(BrandAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class AutoPartAdmin(admin.ModelAdmin):
    fields = ['part_title','part_number','origin','description','feature']

    list_display = ('part_title','part_number')
    inlines = [AutoPartCategoryInline,AutoPartBrandInline,AutoPartPictureInline]

            
admin.site.register(AutoPart, AutoPartAdmin)
