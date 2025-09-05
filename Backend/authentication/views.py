from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token
from rest_framework import status
from .serializers import LoginSerializer, SignUpSerializer
from user.models import User

class LoginAPIView(APIView): 

    def post(self, request, format=None): 
        print(request.data)
        serializer = LoginSerializer(data=request.data)

        #Get email and password (extract data)
        if serializer.is_valid(): 
            email = serializer.validated_data['email']
            password = serializer.validated_data['password']


            #Check if the user exist 
            # 1. Check email
            try:
                user_obj = User.objects.get(email = email)
                email = user_obj.email


            except User.DoesNotExist: 
                return Response({"detail": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED)
            
            #authenticate user 
            user = authenticate(email=email, password=password)

            #check whether if the user is valid
            # 2. Check passsword
            if user is not None: 
                token, created = Token.objects.get_or_create(user=user)
                return Response({
                    'token': token.key,
                    'user_id': user.id, 
                    'email': user.email,
                })
            else: 
                return Response({"detail": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED)
            

        # if serializer has error 
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class SignUpAPIView(APIView): 
    
    def post(self, request, format=None): 
        print('in post method')
        serializer = SignUpSerializer(data=request.data)
        print('After getting serializer')
        if serializer.is_valid(): 
            print('serializer is valid')
            email = serializer.validated_data['email']
            password = serializer.validated_data['password']

            print(email)
            print(password)
            print(User.objects.filter(email=email).exists())
            print("filter user")
            if User.objects.filter(email=email).exists(): 
                print('Filter true')
                return Response({
                    'detail': 'Your email has already registered with another account' },   status = status.HTTP_400_BAD_REQUEST)

            print('before creating user')
            user = User.objects.create_user(email=email, password= password)
            print('After creating user')
            return Response({"detail": "User created successfully"}, status=status.HTTP_201_CREATED)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
