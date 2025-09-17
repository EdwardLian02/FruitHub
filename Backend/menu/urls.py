from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'category_api', views.CategoryViewSet)
router.register(r'menu_api', views.MenuViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('type/<str:type>', view=views.MenuTypeView.as_view(), name='type'),
]

