from django.contrib import admin
from .models import Menu, Category

from django.utils.html import format_html

class MenuAdmin(admin.ModelAdmin):
    list_display = ('image_tag','id', 'name', 'price', 'category') 
    list_filter = ('category',)

    def image_tag(self, obj):
        if obj.imageUrl:  # Replace with your actual ImageField name
            return format_html('<img src="{}" width="50" height="50" />', obj.imageUrl.url)
        return "-"
    image_tag.short_description = 'Image'



class MenuListInLine(admin.TabularInline): 
    model = Menu
    extra = 0
    fields = ('name', 'price')



class CategoryAdmin(admin.ModelAdmin): 
    list_display = ('id','name',)
    inlines = [MenuListInLine]


admin.site.register(Menu, MenuAdmin)
admin.site.register(Category, CategoryAdmin)

#To remove the (Delete selected) dropdown
admin.site.disable_action('delete_selected')
