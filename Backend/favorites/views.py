from django.shortcuts import render
from rest_framework import viewsets

from .models import Favorite
from .serializers import CreateFavouriteSerializer

class CreateFavoriteViewSet(viewsets.ModelViewSet): 
    queryset = Favorite.objects.all()
    serializer_class = CreateFavouriteSerializer

    def perform_create(self, serializer):
        serializer.save(user= self.request.user)