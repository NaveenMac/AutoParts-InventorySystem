# Generated by Django 3.0.2 on 2020-03-04 06:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0021_auto_20200228_0755'),
        ('part', '0025_auto_20200303_1219'),
    ]

    operations = [
        migrations.CreateModel(
            name='AutoPartCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('autopart', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='part.AutoPart')),
                ('category', models.ManyToManyField(to='category.Category')),
            ],
        ),
    ]
