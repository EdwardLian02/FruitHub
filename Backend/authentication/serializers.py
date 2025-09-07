from rest_framework import serializers

class LoginSerializer(serializers.Serializer): 
    email = serializers.EmailField()
    password = serializers.CharField(max_length= 255, write_only=True)

    
class SignUpSerializer(serializers.Serializer): 
    email = serializers.EmailField()
    password = serializers.CharField(max_length = 255)

        