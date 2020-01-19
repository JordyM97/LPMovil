from django.db import models

# Create your models here.
class Comentario(models.Model):
    contenido = models.TextField()
    fecha_creacion = models.DateField()

    class Meta:
        db_table = 'Comentario'

class Publicacion(models.Model):
    titulo = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=200)
    categoria = models.CharField(max_length=50)
    path_imagen = models.CharField(max_length=2000)
    fecha_creacion = models.DateField()

    comentarios = models.ManyToManyField(Comentario)

    class Meta:
        db_table = 'Publicacion'


class Pretendiente(models.Model):
    estado = models.CharField(max_length=1, default="P")

    class Meta:
        db_table = 'Pretendiente'

class Mascota(models.Model):
    nombre =  models.CharField(max_length=50)
    edad = models.IntegerField()
    busca_pareja = models.CharField(max_length=1, default="N")
    raza = models.CharField(max_length=50)
    path_imagen = models.CharField(max_length=2000)

    pretendientes = models.ManyToManyField(Pretendiente)

    class Meta:
        db_table = 'Mascota'

class Usuario(models.Model):
    usuario =  models.CharField(primary_key=True, max_length=10)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    edad = models.IntegerField()
    ciudad = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    contrasena = models.CharField(max_length=50)
    path_imagen = models.CharField(max_length=2000)

    mascotas = models.ManyToManyField(Mascota)
    publicaciones = models.ManyToManyField(Publicacion)
    comentarios = models.ManyToManyField(Comentario)

    class Meta:
        db_table = 'Usuario'