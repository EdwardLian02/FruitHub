from rest_framework import serializers
from .models import UserAddress, User

class UserSerializer(serializers.ModelSerializer): 
    class Meta: 
        model = User
        fields = [
            'id', 
            'username', 
            'email', 
            'profile_pic',
            'user_phone',
            'date_joined',
        ]

class UserAddressSerializer(serializers.ModelSerializer): 
    class Meta: 
        model = UserAddress
        fields = [
                    'id',
                    'name',
                    'address',
                    'isCurrentAddress',
                    'phone',
                    'created_at'
                ]
        
        