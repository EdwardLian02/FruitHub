from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from rest_framework.views import APIView
from django_filters.rest_framework import DjangoFilterBackend
from .serializers import CreateOrDeleteOrderSerializer, ViewOrderSerializer, OrderStatusSerializer
from .models import Order, OrderItem
from . import permissions

# Create your views here.
class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    permission_classes = (IsAuthenticated,permissions.IsOrderOwnerOrAdmin)
    filter_backends = (DjangoFilterBackend,)
    filterset_fields = ['status',]
    

    def get_queryset(self):
        qs = super().get_queryset()

        if self.request.user.is_staff: 
            return qs

        return qs.filter(user=self.request.user).order_by('-created_at')
    
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
        
        
class OrderStatusReadOnlyViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderStatusSerializer
    permission_classes = (IsAuthenticated,permissions.IsOrderOwnerOrAdmin)



