from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models

from core.models import BaseModel

class UserManager(BaseUserManager):
    use_in_migrations = True

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("The Email field must be set")
        email = self.normalize_email(email)


        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)

        return self.create_user(email, password, **extra_fields)


class User(AbstractUser):
    username = None
    email = models.EmailField(unique=True)
    profile_pic = models.ImageField(upload_to='profile', default='profile/default_profile.png')

    USERNAME_FIELD = "email"   # <- use email to log in
    REQUIRED_FIELDS = []       # <- no extra required fields

    objects = UserManager()

    def __str__(self):
        return self.email
    

class UserAddress(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    address = models.CharField(max_length= 255)

    def _str_(self): 
        return self.name
