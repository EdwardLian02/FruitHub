from django.shortcuts import render
from rest_framework.authentication import TokenAuthentication
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from .models import Menu, Category
from . import serializers

# Create your views here.
class MenuViewSet(viewsets.ModelViewSet): 
    queryset = Menu.objects.all()
    serializer_class = serializers.MenuSerailzier
    authentication_classes = [TokenAuthentication]
    permission_classes = (IsAuthenticated,)

    

