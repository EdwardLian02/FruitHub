from django.db import models

from user.models import User
from core.models import BaseModel

from menu.models import Menu
# Create your models here.
class Favorite(BaseModel): 
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_fav')
    menu = models.ForeignKey(Menu, on_delete=models.CASCADE, related_name='fav_menu')

    class Meta: 
        unique_together = ('user', 'menu')