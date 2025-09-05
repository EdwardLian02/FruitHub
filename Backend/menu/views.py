from django.shortcuts import render
from rest_framework.authentication import TokenAuthentication
from rest_framework import viewsets
from rest_framework import filters
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from .models import Menu, Category
from . import serializers


# Create your views here.

class CategoryViewSet(viewsets.ModelViewSet): 
    queryset = Category.objects.all()
    serializer_class = serializers.CategorySerializer
    authentication_classes = [IsAdminUser] #only for admin

class MenuViewSet(viewsets.ModelViewSet): 
    queryset = Menu.objects.all()
    serializer_class = serializers.MenuSerailzier
    authentication_classes = [TokenAuthentication]
    filter_backends = [filters.SearchFilter]
    search_fields = ['name']

    #Admin -> CRUD
    #User -> View
    def get_permissions(self):

        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            permission_classes = (IsAdminUser,)
        else: 
            permission_classes = [IsAuthenticated] 
        
        return [permission() for permission in permission_classes]








