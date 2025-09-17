from django.shortcuts import render
from rest_framework import generics
from rest_framework.authentication import TokenAuthentication
from rest_framework import viewsets
from rest_framework import filters
from rest_framework.permissions import IsAuthenticated, IsAdminUser, AllowAny
from .models import Menu, Category
from . import serializers

from django.utils.timezone import now, timedelta
from django.db.models import Count
# Create your views here.

class CategoryViewSet(viewsets.ModelViewSet): 
    queryset = Category.objects.all()
    serializer_class = serializers.CategorySerializer

    #Admin -> CRUD
    #User -> View
    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            permission_classes = (IsAdminUser,)
        else: 
            print("HIIIIII I am printing out because I am user")
            permission_classes = [IsAuthenticated] 
        
        return [permission() for permission in permission_classes]

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
    

class MenuTypeView(generics.ListAPIView):
    serializer_class = serializers.MenuSerailzier
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        #Hottest (most order recently -> within 7 days)
        #Popular (most order products)
        #New (created_date >= now()-7days)

        type = self.kwargs.get('type')
        qs = Menu.objects.all()

        if type == 'hottest': 
            print("HI hottie")
            lastWeek = now() - timedelta(days=7)
            
            qs = Menu.objects.filter(order_item__order__created_at__gte =lastWeek).annotate(order_count = Count("order_item")).order_by("-order_count")

        elif type == 'popular': 

            print("print out order count")
            print(Menu.objects.annotate(order_count = Count("order_item__order")))
            qs = Menu.objects.annotate(order_count = Count("order_item")).order_by("-order_count")

        elif type == 'new': 
            recent = now() - timedelta(days=7) # 
            qs = Menu.objects.filter(created_at__gte = recent).all()

        return qs














