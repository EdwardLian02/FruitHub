from rest_framework import permissions

class IsOwnerOrAdmin(permissions.BasePermission): 

    #only the order own can access the order
    def has_object_permission(self, request, view, obj):
        print(obj.user.is_staff)
        return obj.user == request.user or request.user.is_staff