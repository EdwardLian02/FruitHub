from rest_framework import serializers
from .models import UserAddress

class UserAddressSerializer(serializers.ModelSerializer): 
    class Meta: 
        model = UserAddress
        fields = [
                    'id',
                    'name',
                    'address',
                    'created_at'
                ]
        
        