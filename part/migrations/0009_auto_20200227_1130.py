# Generated by Django 3.0.2 on 2020-02-27 11:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('brand', '0005_auto_20200226_0746'),
        ('part', '0008_auto_20200227_1121'),
    ]

    operations = [
        migrations.AlterField(
            model_name='autopartbrand',
            name='brand',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='brand.Brand'),
        ),
    ]