# Generated by Django 3.0.2 on 2020-02-26 07:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0001_initial'),
        ('brand', '0004_auto_20200226_0632'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brandcategory',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='category.Category'),
        ),
    ]
