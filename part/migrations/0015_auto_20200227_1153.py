# Generated by Django 3.0.2 on 2020-02-27 11:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('part', '0014_auto_20200227_1152'),
    ]

    operations = [
        migrations.AlterField(
            model_name='autopartbrand',
            name='autopart',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='part.AutoPart'),
        ),
    ]
