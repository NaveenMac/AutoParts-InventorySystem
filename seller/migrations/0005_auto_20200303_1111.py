# Generated by Django 3.0.3 on 2020-03-03 11:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0021_auto_20200228_0755'),
        ('seller', '0004_auto_20200303_1047'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sellercategory',
            name='category',
        ),
        migrations.AddField(
            model_name='sellercategory',
            name='category',
            field=models.ManyToManyField(to='category.Category'),
        ),
        migrations.AlterField(
            model_name='sellercategory',
            name='seller',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='seller.Seller'),
        ),
    ]
