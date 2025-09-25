from django.contrib import admin
from .models import Order, OrderItem

class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 0
    can_delete = False 
    readonly_fields = ('order','menu', 'qty')
    

    def has_add_permission(self, request, obj=None):
        return False
    
    def has_delete_permission(self, request, obj = None):
        return False

class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'status', 'total_price')
    list_editable = ('status',)  
    readonly_fields = ('user', 'total_price')  
    inlines = [OrderItemInline]
    list_filter = ('status',)
    search_fields = ('id__icontains',)
    
    def has_add_permission(self, request):
        return False  

    def has_delete_permission(self, request, obj=None):
        return False  

admin.site.register(Order, OrderAdmin)
