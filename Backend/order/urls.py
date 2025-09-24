from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r'order/status', viewset=views.OrderStatusReadOnlyViewSet, basename='status'),
router.register(r'order', viewset=views.OrderViewSet, basename='orders'),


urlpatterns = [
    path('/', include(router.urls)),    
]
