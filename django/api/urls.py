#aqui se crean las urls de cada tabla

from rest_framework import routers

from .viewsets import ComentarioViewSet
from .viewsets import PublicacionViewSet
from .viewsets import PretendienteViewSet
from .viewsets import MascotaViewSet
from .viewsets import UsuarioViewSet

ROUTER = routers.SimpleRouter()
ROUTER.register('comentarios', ComentarioViewSet)
ROUTER.register('publicaciones', PublicacionViewSet)
ROUTER.register('pretendientes', PretendienteViewSet)
ROUTER.register('mascotas', MascotaViewSet)
ROUTER.register('usuarios', UsuarioViewSet)

urlpatterns = ROUTER.urls