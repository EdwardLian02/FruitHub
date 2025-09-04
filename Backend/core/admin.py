from django.contrib import admin

from Backend.favorites.models import Favorite
from Backend.menu.models import Category, Menu
from Backend.order.models import Order, OrderItem

# Register your models here.
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Menu)
admin.site.register(Category)
admin.site.register(Favorite)
