from django.contrib import admin
from django import forms
from brand.models import Brand
from brand.models import BrandCategory
from part.models import Category
from django.utils.html import mark_safe
# Register your models here.

class BrandCategoryInline(admin.TabularInline):
    model = BrandCategory

class BrandAdmin(admin.ModelAdmin):
    fields = ('name','description','website','upload',('contact_name','contact_number'))
    
    list_display = ('name','website','brand_image')
    inlines = [BrandCategoryInline]
    readonly_fields = ('brand_image',)
    def brand_image(self,obj):
        from django.utils.html import escape
        return mark_safe('<img src="/%s" />' % (obj.upload))
    brand_image.short_description = 'Brand Image'
    brand_image.allow_tags = True
    
    class CustomModelChoiceField(forms.ModelChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'category':
            return self.CustomModelChoiceField(queryset = Category.objects)

            return super(CategoryAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
        
        if db_field.name == 'brand':
            return self.CustomModelChoiceField(queryset = Brand.objects)
        
            return super(BrandAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

#class BrandCategoryAdmin(admin.ModelAdmin):
#    fields = ('brand','category')
#    list_display = ('brand_list','category_list')
#    inlines = [AutoPartCategoryInline,AutoPartBrandInline,AutoPartPictureInline]
#    def brand_list(self,obj):
#        return obj.brand.name
#    def category_list(self,obj):
#        return obj.category.name
#
#    class CustomModelChoiceField(forms.ModelChoiceField):
#        def label_from_instance(self, obj):
#            return obj.name
#
#    def formfield_for_foreignkey(self, db_field, request, **kwargs):
#        if db_field.name == 'category':
#            return self.CustomModelChoiceField(queryset = Category.objects)
#
#            return super(CategoryAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
#
#        if db_field.name == 'brand':
#            return self.CustomModelChoiceField(queryset = Brand.objects)
#
#            return super(BrandAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
#
#

admin.site.register(Brand, BrandAdmin)
#admin.site.register(BrandCategory, BrandCategoryAdmin)

