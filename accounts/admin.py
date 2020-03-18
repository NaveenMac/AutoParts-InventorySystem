from django.contrib import admin
from accounts.models import User
from seller.models import Seller
from django import forms
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    model = User
    
    
    class CustomModelChoiceField(forms.ModelChoiceField):
        def label_from_instance(self, obj):
            return obj.name
    # If need to add parent field then comment this def block after after add uncomment it
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'seller':
            return self.CustomModelChoiceField(queryset = Seller.objects)

            return super(UserAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
                    
admin.site.register(User, UserAdmin)
