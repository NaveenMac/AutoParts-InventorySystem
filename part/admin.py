from django.contrib import admin
from part.models import AutoPart
from part.models import AutoPartPicture
from part.models import AutoPartCategory
from part.models import AutoPartBrand

# Register your models here.

class AutoPartPictureInline(admin.TabularInline):
    model = AutoPartPicture

class AutoPartCategoryInline(admin.TabularInline):
    model = AutoPartCategory

class AutoPartBrandInline(admin.TabularInline):
    model = AutoPartBrand

class AutoPartAdmin(admin.ModelAdmin):
    fields = ['part_title','part_number','description','feature']

    list_display = ('part_title','part_number')
    inlines = [AutoPartCategoryInline,AutoPartBrandInline,AutoPartPictureInline]

            
admin.site.register(AutoPart, AutoPartAdmin)
