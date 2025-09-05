from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'menu_api', views.MenuViewSet)
router.register(r'category_api', views.CategoryViewSet)

urlpatterns = [
    path('', include(router.urls)),
]

