from django.apps.registry import Apps

app_config = apps.get_app_config('car')

# To create Content Types
from django.contrib.contenttypes.management import create_contenttypes
create_contenttypes(app_config)

# To create Permissions
from django.contrib.auth.management import create_permissions
create_permissions(app_config)
