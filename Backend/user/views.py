from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from .serializers import UserAddressSerializer
from .models import UserAddress
from core import permissions

# Create your views here.
class UserAddressViewSet(viewsets.ModelViewSet): 
    queryset = UserAddress.objects.all()
    serializer_class = UserAddressSerializer
    permission_classes = [IsAuthenticated, permissions.IsOwnerOrAdmin]

    def get_queryset(self):
        qs = super().get_queryset()
        if self.request.user.is_staff: 
            return qs
        return qs.filter(user=self.request.user).order_by('created_at')

    def perform_create(self, serializer):
        serializer.save(user = self.request.user)
    
