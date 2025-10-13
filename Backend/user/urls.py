from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'user/address', viewset=views.UserAddressViewSet, basename='address')
router.register(r'user', viewset=views.UserViewSet, basename='user')

urlpatterns = [
    path('', include(router.urls)),
    
]
