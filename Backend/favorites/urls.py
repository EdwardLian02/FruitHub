from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'favorite', viewset=views.FavoriteViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
