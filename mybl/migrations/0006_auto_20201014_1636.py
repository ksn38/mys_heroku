# Generated by Django 3.1.2 on 2020-10-14 16:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mybl', '0005_auto_20201014_1630'),
    ]

    operations = [
        migrations.RenameField(
            model_name='comment',
            old_name='bPost',
            new_name='bpost',
        ),
    ]
