from rest_framework import serializers

from favorites.models import Favorite
from .models import Menu, Category


class CategorySerializer(serializers.ModelSerializer): 
    class Meta: 
        model = Category
        fields = (
            'name',
        )

class MenuSerailzier(serializers.ModelSerializer):

    is_favorite = serializers.SerializerMethodField()
    favorite_id = serializers.SerializerMethodField()
    class Meta: 
        model = Menu
        fields = [
            'id',
            'name', 
            'description',
            'price',
            'imageUrl',
            'category',
            'is_favorite',
            'favorite_id',
        ]

    def get_is_favorite(self, obj):
        request = self.context.get('request')
        if request.user is None: 
            return False
        return Favorite.objects.filter(user=request.user, menu=obj).exists()
    
    
    def get_favorite_id(self, obj):
        request = self.context.get('request')
        if request.user is None:
            return None

        favorite = Favorite.objects.filter(user=request.user, menu=obj).first()
        
        if favorite:
            return favorite.id
        
        return None
