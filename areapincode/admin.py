from django.contrib import admin
from areapincode.models import AreaPincode
# Register your models here.
class AreaPincodeAdmin(admin.ModelAdmin):
    fields = ('pincode',)
    
admin.site.register(AreaPincode, AreaPincodeAdmin)

