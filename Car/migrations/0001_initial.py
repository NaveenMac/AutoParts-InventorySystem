# Generated by Django 3.0.2 on 2020-02-18 10:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CarMaker',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('shortName', models.CharField(max_length=4)),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('updated_on', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='CarModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('model', models.CharField(default='-', max_length=100)),
                ('released_on', models.DateField(auto_now_add=True)),
                ('closed_on', models.DateField(auto_now_add=True)),
                ('engine', models.FloatField()),
                ('power', models.FloatField()),
                ('fuel_type', models.CharField(choices=[('DL', 'Diesel'), ('PL', 'Petrol'), ('CG', 'CNG')], default='PL', max_length=2)),
                ('engine_type', models.CharField(default='-', max_length=50)),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('maker', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='car.CarMaker')),
            ],
        ),
    ]
