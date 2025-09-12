from django.db import transaction

from menu.serializers import MenuSerailzier
from .models import Order, OrderItem
from rest_framework import serializers

class CreateOrDeleteOrderSerializer(serializers.ModelSerializer):
    class OrderItemSerializer(serializers.ModelSerializer): 
        class Meta: 
            model = OrderItem
            fields = [
                'menu', 
                'qty',
            ]

    items = OrderItemSerializer(many=True)
    class Meta: 
        model = Order
        fields = [
            'user',
            'status',
            'items',
            ]
        extra_kwargs = {
            "user": {"read_only": True}
        }

    
    #To create "OrderItem" in the order 
    def create(self, validated_data):
        print('create method')
        order_items = validated_data.pop('items')
        print(f'validate data: {validated_data}')
        with transaction.atomic(): 
            #create order first
            print('creating order')
            order = Order.objects.create(**validated_data)

            #Create each order item record
            print('creating order items')
            OrderItem.objects.bulk_create([
                OrderItem(order=order, **item) for item in order_items      
            ])

            return order
        

    
class ViewOrderSerializer(serializers.ModelSerializer):

    class OrderItemSerializer(serializers.ModelSerializer):
        menu = MenuSerailzier()
        class Meta: 
            model = OrderItem
            fields = [
                'menu', 
                'qty', 
            ]

    items = OrderItemSerializer(many=True)
    class Meta: 
        model = Order
        fields = [
            'id',
            'user',
            'status',
            'total_price', 
            'items',
        ]


class OrderSerializer(serializers.ModelSerializer):
    class Meta: 
        model = Order
        fields = [
            'id',
            'user', 
            'status',
        ]