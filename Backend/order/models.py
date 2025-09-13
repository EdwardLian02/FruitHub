from django.db import models
from core.models import BaseModel
from user.models import User
from menu.models import Menu


# Create your models here.
class Order(BaseModel): 

    STATUS_CHOICE = [
        ('P', 'Pending'), 
        ('R', 'Reject'), 
        ('C', 'Confirm'), 
        ('BD', 'Being Delivered'),
        ('D', 'Delivered'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_set')
    status = models.CharField(max_length=5, choices=STATUS_CHOICE, default='P')
    
    @property
    def total_price(self): 
        return sum(item.qty * item.menu.price for item in self.orders.all()) 
    

class OrderItem(BaseModel): 
    order  = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='orders')
    menu = models.ForeignKey(Menu,on_delete=models.DO_NOTHING, related_name='order_item')
    qty = models.IntegerField()
