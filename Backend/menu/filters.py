import django_filters
from . import models

class MenuFilter(django_filters.FilterSet):
    category = django_filters.ModelMultipleChoiceFilter(
        field_name='category',
        queryset=models.Category.objects.all()
    )

    class Meta:
        model = models.Menu
        fields = ['category']