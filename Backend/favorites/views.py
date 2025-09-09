from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.permissions import IsAdminUser, IsAuthenticated, AllowAny

from .models import Favorite
from .serializers import CreateFavouriteSerializer

class FavoriteViewSet(viewsets.ModelViewSet): 
    queryset = Favorite.objects.all()
    serializer_class = CreateFavouriteSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        if self.request.user.is_staff: 
            return super().get_queryset()
        return self.queryset.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user= self.request.user)