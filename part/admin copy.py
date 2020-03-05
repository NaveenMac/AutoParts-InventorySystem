from django.contrib import admin
from django import forms
from part.models import AutoPart
from part.models import AutoPartPicture
from part.models import AutoPartSeller
from part.models import AutoPartBrand
from part.models import AutoPartCategory
from category.models import Category
from brand.models import Brand
from seller.models import Seller

# Register your models here.

class AutoPartPictureInline(admin.TabularInline):
    model = AutoPartPicture

class AutoPartSellerInline(admin.TabularInline):
    model = AutoPartSeller
    class CustomModelChoiceField(forms.ModelMultipleChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == "seller":
            return self.CustomModelChoiceField(queryset = Seller.objects)
            #            kwargs["queryset"] = Category.objects.filter(is_class=1)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

class AutoPartCategoryInline(admin.TabularInline):
    model = AutoPartCategory
    class CustomModelChoiceField(forms.ModelMultipleChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_manytomany(self, db_field, request, **kwargs):
       if db_field.name == "category":
           return self.CustomModelChoiceField(queryset = Category.objects.filter(is_class=1))
           #            kwargs["queryset"] = Category.objects.filter(is_class=1)
       return super().formfield_for_manytomany(db_field, request, **kwargs)
       
#    def formfield_for_foreignkey(self, db_field, request, **kwargs):
#
#        if db_field.name == 'category':
#            return self.CustomModelChoiceField(queryset = Category.objects.filter(is_class=1))
#
#            return super(CategoryAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
                
class AutoPartBrandInline(admin.TabularInline):
    model = AutoPartBrand
    class CustomModelChoiceField(forms.ModelMultipleChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == "brand":
            return self.CustomModelChoiceField(queryset = Brand.objects)
            #            kwargs["queryset"] = Category.objects.filter(is_class=1)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

class AutoPartAdmin(admin.ModelAdmin):
    fields = ['part_title','part_number','origin','description','feature']

    list_display = ('part_title','part_number')
    inlines = [AutoPartCategoryInline,AutoPartSellerInline,AutoPartBrandInline,AutoPartPictureInline]

            
admin.site.register(AutoPart, AutoPartAdmin)
