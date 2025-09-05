from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r'order_api', viewset=views.CreateOrderViewSet),

urlpatterns = [
    path('', include(router.urls)),    
]
