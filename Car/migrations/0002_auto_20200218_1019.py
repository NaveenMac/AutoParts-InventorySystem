# Generated by Django 3.0.2 on 2020-02-18 10:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('car', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='carmodel',
            name='closed_on',
            field=models.DateField(),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='released_on',
            field=models.DateField(),
        ),
    ]
