# Generated by Django 3.0.2 on 2020-03-05 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('areapincode', '0002_auto_20200305_1217'),
        ('part', '0027_auto_20200305_1137'),
    ]

    operations = [
        migrations.AddField(
            model_name='autopartseller',
            name='availability',
            field=models.ManyToManyField(to='areapincode.AreaPincode'),
        ),
        migrations.AddField(
            model_name='autopartseller',
            name='in_stock',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='autopartseller',
            name='out_stock',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='autopartseller',
            name='stock_in_process',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='autopartseller',
            name='unit_price',
            field=models.FloatField(default=0),
        ),
    ]