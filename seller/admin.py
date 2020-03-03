from django.contrib import admin
from django import forms
from seller.models import Seller
from seller.models import SellerCategory
from part.models import Category
from django.utils.html import mark_safe
# Register your models here.

class SellerCategoryInline(admin.StackedInline):
    model = SellerCategory
    class CustomModelChoiceField(forms.ModelMultipleChoiceField):
        def label_from_instance(self, obj):
            return obj.name
        
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        
        if db_field.name == 'category':
            return self.CustomModelChoiceField(queryset = Category.objects)
            
            return super(CategoryAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

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
    
    
#class SellerCategoryAdmin(admin.ModelAdmin):
#    fields = ('seller','category')
#    list_display = ('seller_list','category_list')
#
#    def seller_list(self,obj):
#        return obj.seller.name
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
#        if db_field.name == 'seller':
#            return self.CustomModelChoiceField(queryset = Seller.objects)
#
#            return super(SellerAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

admin.site.register(Seller, SellerAdmin)
#admin.site.register(SellerCategory, SellerCategoryAdmin)

