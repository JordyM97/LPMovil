# Generated by Django 2.2.9 on 2020-01-12 18:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Comentario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contenido', models.TextField()),
                ('fecha_creacion', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Mascota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('edad', models.IntegerField()),
                ('busca_pareja', models.CharField(default='N', max_length=1)),
                ('raza', models.CharField(max_length=50)),
                ('path_imagen', models.CharField(max_length=2000)),
            ],
        ),
        migrations.CreateModel(
            name='Pretendiente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estado', models.CharField(default='P', max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='Publicacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=50)),
                ('descripcion', models.CharField(max_length=200)),
                ('categoria', models.CharField(max_length=50)),
                ('path_imagen', models.CharField(max_length=2000)),
                ('fecha_creacion', models.DateField()),
                ('comentarios', models.ManyToManyField(to='api.Comentario')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('usuario', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=50)),
                ('apellido', models.CharField(max_length=50)),
                ('edad', models.IntegerField()),
                ('ciudad', models.CharField(max_length=50)),
                ('correo', models.CharField(max_length=50)),
                ('contrasena', models.CharField(max_length=50)),
                ('path_imagen', models.CharField(max_length=2000)),
                ('comentarios', models.ManyToManyField(to='api.Comentario')),
                ('mascotas', models.ManyToManyField(to='api.Mascota')),
                ('publicaciones', models.ManyToManyField(to='api.Publicacion')),
            ],
        ),
        migrations.AddField(
            model_name='mascota',
            name='pretendientes',
            field=models.ManyToManyField(to='api.Pretendiente'),
        ),
    ]
