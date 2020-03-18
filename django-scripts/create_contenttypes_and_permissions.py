from django.apps.registry import Apps

app_config = apps.get_app_config('car')

# To create Content Types
from django.contrib.contenttypes.management import create_contenttypes
create_contenttypes(app_config)

# To create Permissions
from django.contrib.auth.management import create_permissions
create_permissions(app_config)



#Clear migrations folder except init
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete



#THIS IS TO APPLY CUSTOM MODEL CHANGES AFTER ACTUAL USER MODEL
You have to clear admin, auth, contenttypes, and sessions from the migration history and also drop the tables. First, remove the migration folders of your apps and then type the following:
python manage.py migrate admin zero
python manage.py migrate auth zero
python manage.py migrate contenttypes zero
python manage.py migrate sessions zero
Afterwards, you can run makemigrations accounts and migrate accounts.



#Create superuser
python3 manage.py createsuperuser
