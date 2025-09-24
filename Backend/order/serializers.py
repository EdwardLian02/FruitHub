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

    orders = OrderItemSerializer(many=True)
    class Meta: 
        model = Order
        fields = [
            'user',
            'status',
            'orders',
            ]
        extra_kwargs = {
            "user": {"read_only": True}
        }

    
    #To create "OrderItem" in the order 
    def create(self, validated_data):
        order_items = validated_data.pop('orders')
        with transaction.atomic(): 
            #create order first

            order = Order.objects.create(**validated_data)

            #Create each order item record

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

    orders = OrderItemSerializer(many=True)
    class Meta: 
        model = Order
        fields = [
            'id',
            'user',
            'status',
            'total_price', 
            'created_at',
            'orders',
        ]


class OrderStatusSerializer(serializers.ModelSerializer):
    class Meta: 
        model = Order
        fields = [
            'status'
        ]