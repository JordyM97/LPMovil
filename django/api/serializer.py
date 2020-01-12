from rest_framework import serializers
from .models import Comentario
from .models import Publicacion
from .models import Pretendiente
from .models import Mascota
from .models import Usuario

class ComentarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comentario
        fields = '__all__'

class PublicacionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Publicacion
        fields = '__all__'

class PretendienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pretendiente
        fields = '__all__'

class MascotaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mascota
        fields = '__all__'

class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'