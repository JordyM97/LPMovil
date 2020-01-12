#aqui van todos los archivos serializer
from rest_framework import viewsets

from .models import Comentario
from .models import Publicacion
from .models import Pretendiente
from .models import Mascota
from .models import Usuario

from .serializer import ComentarioSerializer
from .serializer import PublicacionSerializer
from .serializer import PretendienteSerializer
from .serializer import MascotaSerializer
from .serializer import UsuarioSerializer

class ComentarioViewSet(viewsets.ModelViewSet):
    """Viewset for Patient model"""
    queryset = Comentario.objects.all()
    serializer_class = ComentarioSerializer

class PublicacionViewSet(viewsets.ModelViewSet):
    """Viewset for Patient model"""
    queryset = Publicacion.objects.all()
    serializer_class = PublicacionSerializer  

class PretendienteViewSet(viewsets.ModelViewSet):
    """Viewset for Patient model"""
    queryset = Pretendiente.objects.all()
    serializer_class = PretendienteSerializer  

class MascotaViewSet(viewsets.ModelViewSet):
    """Viewset for Patient model"""
    queryset = Mascota.objects.all()
    serializer_class = MascotaSerializer

class UsuarioViewSet(viewsets.ModelViewSet):
    """Viewset for Patient model"""
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer