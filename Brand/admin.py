from django.contrib import admin
from django import forms
from brand.models import Brand
from django.utils.html import mark_safe
# Register your models here.

class BrandAdmin(admin.ModelAdmin):
    fields = ('name','description','website','upload',('contact_name','contact_number'))
    
    list_display = ('name','website','brand_image')
    readonly_fields = ('brand_image',)
    def brand_image(self,obj):
        from django.utils.html import escape
        return mark_safe('<img src="/%s" />' % (obj.upload))
    brand_image.short_description = 'Brand Image'
    brand_image.allow_tags = True

admin.site.register(Brand, BrandAdmin)
