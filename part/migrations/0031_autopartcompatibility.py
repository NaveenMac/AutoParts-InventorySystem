# Generated by Django 3.0.4 on 2020-03-17 07:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carmaker', '0001_initial'),
        ('part', '0030_auto_20200316_0711'),
    ]

    operations = [
        migrations.CreateModel(
            name='AutoPartCompatibility',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('autopart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='part.AutoPart')),
                ('carmaker', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='carmaker.CarMaker')),
                ('carmakermodel', models.ManyToManyField(to='carmaker.CarMakerModel')),
            ],
        ),
    ]
