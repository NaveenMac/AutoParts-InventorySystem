# Generated by Django 3.0.2 on 2020-02-19 10:54

from django.db import migrations, models
import django.db.models.deletion
import phone_field.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('part', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Enter seller name', max_length=30)),
                ('contact_name', models.CharField(blank=True, help_text='Enter contact person name', max_length=30)),
                ('contact_number', phone_field.models.PhoneField(blank=True, help_text='Enter contact phone number', max_length=31)),
                ('description', models.TextField(blank=True, help_text='Enter a brief description of the seller', max_length=1000)),
                ('website', models.URLField(blank=True, help_text='Enter seller website address')),
                ('upload', models.ImageField(help_text='upload seller image', upload_to='assets/seller/')),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('updated_on', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='SellerCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='part.PartCategory')),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='seller.Seller')),
            ],
        ),
    ]
