# Generated by Django 3.0.2 on 2020-02-28 08:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('part', '0017_auto_20200228_0535'),
    ]

    operations = [
        migrations.AlterField(
            model_name='autopartcategory',
            name='autopart',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='part.AutoPart'),
        ),
    ]
