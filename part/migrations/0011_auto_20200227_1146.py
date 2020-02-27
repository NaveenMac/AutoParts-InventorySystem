# Generated by Django 3.0.2 on 2020-02-27 11:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0014_auto_20200227_1000'),
        ('part', '0010_auto_20200227_1145'),
    ]

    operations = [
        migrations.AlterField(
            model_name='autopartcategory',
            name='category',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='category.Category'),
        ),
    ]
