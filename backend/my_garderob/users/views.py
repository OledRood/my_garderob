from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import UserSerializer
from django.contrib.auth.models import User


class RegisterAPIView(APIView):
    """
    Апи для регистрации. Возвращает логин и созданный токен
    """
    def post(self, request, *args, **kwargs):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = User.objects.create_user(
                email=serializer.validated_data.get('email'),
                username=serializer.validated_data.get('username'),
                password=serializer.validated_data.get('password'),
            )
            token = Token.objects.create(user=user)
            return Response({'username': user.username, "token": token.key}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer._errors, status=status.HTTP_400_BAD_REQUEST)


class LoginAPIView(APIView):
    """
    Апи для авторизации. При пост запросе с правильными параметрами username и password возвращает токен
    """
    def post(self, request):
        username = request.data.get("username")
        password = request.data.get("password")
        if (user := User.objects.filter(username=username).first()) and user.check_password(password):
            token, _ = Token.objects.get_or_create(user=user)
            return Response({"token": token.key}, status=status.HTTP_201_CREATED)
        else:
            return Response(status=status.HTTP_404_NOT_FOUND)