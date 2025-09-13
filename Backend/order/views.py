from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from .serializers import CreateOrDeleteOrderSerializer, ViewOrderSerializer
from .models import Order, OrderItem

# Create your views here.
class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        if self.request.user.is_staff: 
            return super().get_queryset()

        return self.queryset.filter(user=self.request.user)
    
    def get_serializer_class(self):
        if self.action in ['list', 'retrieve']: 
            return ViewOrderSerializer
        else : 
            return CreateOrDeleteOrderSerializer


    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def perform_destroy(self, instance):    
        if instance.status != 'P': 
            raise ValidationError("ONLY orders with status 'Pending' can be deleted.")
        instance.delete()
        
        