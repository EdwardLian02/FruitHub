from django.db import models
from core.models import BaseModel

# Create your models here.



class Category(BaseModel): 
    CATEGORY_CHOICES = [
        ('Fruits', 'Fruits'), 
        ('Salad', 'Salad'),
        ('Juice & Smoothies', 'Juice & Smoothies'), 
        ('Combo pack', 'Combo pack')
    ]

    name = models.CharField(max_length=255, choices=CATEGORY_CHOICES)

class Menu(BaseModel): 
    category = models.ForeignKey(Category, on_delete= models.CASCADE, related_name='category_set')
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    imageUrl = models.ImageField(upload_to='menu/', blank=False, null=False)