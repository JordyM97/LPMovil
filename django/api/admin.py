from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import *

admin.site.register(Comentario)
admin.site.register(Publicacion)
admin.site.register(Pretendiente)
admin.site.register(Mascota)
admin.site.register(Usuario)
