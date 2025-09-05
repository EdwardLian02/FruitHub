from django.db import transaction
from .models import Order, OrderItem
from rest_framework import serializers

class CreateOrderSerializer(serializers.ModelSerializer):
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
        fields = ['user', 'status', 'items']
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
            for item in order_items: 
                OrderItem.objects.create(order=order, **item)

            return order
    