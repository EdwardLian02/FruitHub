from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'menu/category', views.CategoryViewSet, basename='category')
router.register(r'menu', views.MenuViewSet, basename='menus')


urlpatterns = [
    path('', include(router.urls)),
    path('type/<str:type>', view=views.MenuTypeView.as_view(), name='type'),
]

