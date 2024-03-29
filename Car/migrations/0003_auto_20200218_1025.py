# Generated by Django 3.0.2 on 2020-02-18 10:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('car', '0002_auto_20200218_1019'),
    ]

    operations = [
        migrations.AlterField(
            model_name='carmodel',
            name='closed_on',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='engine_type',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='model',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='released_on',
            field=models.DateField(blank=True, null=True),
        ),
    ]
