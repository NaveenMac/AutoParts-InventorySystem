# Generated by Django 3.0.2 on 2020-02-28 07:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0019_auto_20200228_0651'),
    ]

    operations = [
        migrations.RenameField(
            model_name='category',
            old_name='parent_category',
            new_name='parent',
        ),
    ]
