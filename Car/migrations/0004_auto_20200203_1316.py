# Generated by Django 3.0.2 on 2020-02-03 13:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Car', '0003_auto_20200203_1312'),
    ]

    operations = [
        migrations.AddField(
            model_name='carlist',
            name='modifications',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='carlist',
            name='modelline',
            field=models.CharField(max_length=20),
        ),
    ]
