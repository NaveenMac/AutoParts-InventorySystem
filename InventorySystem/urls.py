"""InventorySystem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path



admin.site.site_header = 'Inventory Admin'
admin.site.site_title = 'Inventory Admin'
admin.site.site_url = 'http://inventory.com'
admin.site.index_title = 'Inventory administration'
admin.empty_value_display = '**Empty**'
urlpatterns = [
   
    path('admin/', admin.site.urls),
    path('djrichtextfield/', include('djrichtextfield.urls'))
]
