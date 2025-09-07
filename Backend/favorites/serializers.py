from django.db import transaction
from .models import Favorite
from rest_framework import serializers

class CreateFavouriteSerializer(serializers.ModelSerializer): 
    class Meta: 
        model = Favorite
        fields = [
            'id',
            'user', 
            'menu', 
        ]
        extra_kwargs= {
            'user': {'read_only': True}
        }

    # To validate that user does't create same fav menu twice
    def validate(self, attrs):
        request = self.context.get('request')
        print('in validate function ')
        menu = attrs['menu']
        if Favorite.objects.filter(user=hasattr(request, 'user'), menu=menu).exists():
            raise serializers.ValidationError('This menu is already in favorite!')
        return attrs