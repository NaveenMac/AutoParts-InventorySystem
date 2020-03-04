# Generated by Django 3.0.3 on 2020-03-03 12:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('seller', '0006_auto_20200303_1113'),
        ('brand', '0006_auto_20200303_1145'),
        ('part', '0024_autopart_origin'),
    ]

    operations = [
        migrations.CreateModel(
            name='AutoPartSeller',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('autopart', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='part.AutoPart')),
                ('seller', models.ManyToManyField(to='seller.Seller')),
            ],
        ),
        migrations.RemoveField(
            model_name='autopartbrand',
            name='brand',
        ),
        migrations.AddField(
            model_name='autopartbrand',
            name='brand',
            field=models.ManyToManyField(to='brand.Brand'),
        ),
        migrations.DeleteModel(
            name='AutoPartCategory',
        ),
    ]