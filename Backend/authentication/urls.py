from rest_framework.authtoken import views
from . import views as thisView
from django.urls import path

urlpatterns= [
    path('api-token-auth/', views.obtain_auth_token), 
    path('user/login/', thisView.LoginAPIView.as_view(), name='login'),
    path('user/signup/', thisView.SignUpAPIView.as_view(), name='signup'),
]