from django.contrib.admin import AdminSite

from django.contrib import admin
from django import forms
from seller.models import Seller
from seller.models import SellerCategory
from part.models import Category
from django.utils.html import mark_safe
# Register your models here.



class SellerAdminSite(AdminSite):
    site_header = "Seller Admin"
    site_title = "Seller Admin Portal"
    index_title = "Welcome to Admin Site Portal"
    
seller_admin_site = SellerAdminSite(name="seller_admin")


class SellerCategoryInline(admin.StackedInline):
    model = SellerCategory
    class CustomModelChoiceField(forms.ModelMultipleChoiceField):
        def label_from_instance(self, obj):
            return obj.name
        
    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == "category":
            return self.CustomModelChoiceField(queryset = Category.objects.filter(is_class=1))
            #            kwargs["queryset"] = Category.objects.filter(is_class=1)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

class SellerAdmin(admin.ModelAdmin):
    
    fieldsets = (
                 ('Seller Information',{
                  'fields':('name','description','website','upload',('contact_name','contact_number')),}),)
    list_display = ('name','website','seller_image')
    inlines = [SellerCategoryInline]
    readonly_fields = ('seller_image',)
    def seller_image(self,obj):
        from django.utils.html import escape
        return mark_safe('<img src="/%s" />' % (obj.upload))
    seller_image.short_description = 'Seller Image'
    seller_image.allow_tags = True
    


seller_admin_site.register(Seller, SellerAdmin)


