# Generated by Django 3.1.2 on 2020-12-02 11:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mybl', '0017_auto_20201202_1101'),
    ]

    operations = [
        migrations.RenameField(
            model_name='ticker',
            old_name='sp500',
            new_name='sp50',
        ),
    ]
