# Generated by Django 3.0.3 on 2020-03-03 11:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0021_auto_20200228_0755'),
        ('brand', '0005_auto_20200226_0746'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brandcategory',
            name='brand',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='brand.Brand'),
        ),
        migrations.RemoveField(
            model_name='brandcategory',
            name='category',
        ),
        migrations.AddField(
            model_name='brandcategory',
            name='category',
            field=models.ManyToManyField(to='category.Category'),
        ),
    ]
