from django.contrib import admin

from favorites.models import Favorite
from user.models import User

class FavoriteAdmin(admin.ModelAdmin): 
    list_display = ('menu', 'user',)
    readonly_fields = ('menu', 'user')
    list_filter = ('user',)
    def has_add_permission(self, request):
        return False
    
    def has_delete_permission(self, request, obj = ...):
        return False

admin.site.register(Favorite, FavoriteAdmin)