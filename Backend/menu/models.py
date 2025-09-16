from django.db import models
from core.models import BaseModel

# Create your models here.

class Category(BaseModel): 
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name
    

class Menu(BaseModel): 

    TYPE_CHOICE = [
        ('hottest', 'Hottest'), 
        ('popular', 'Popular'), 
        ('new', 'New'), 
    ]

    category = models.ForeignKey(Category, on_delete= models.CASCADE, related_name='category_set')
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    imageUrl = models.ImageField(upload_to='menu/', blank=False, null=False)
    type = models.CharField(choices=TYPE_CHOICE, max_length=20, null=True, blank=True)
    rating = models.FloatField(default=0.0)   #for storing avg rating. 
    rating_count = models.IntegerField(default=0) 

    def __str__(self):
        return self.name

       