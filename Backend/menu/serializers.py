from rest_framework import serializers
from .models import Menu, Category

class CategorySerializer(serializers.ModelSerializer): 
    class Meta: 
        model = Category
        fields = (
            'name',
        )

class MenuSerailzier(serializers.ModelSerializer): 
    class Meta: 
        model = Menu
        fields = [
            'name', 
            'description',
            'price',
            'imageUrl',
            'category',
        ]

