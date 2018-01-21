from django.contrib import admin

from .models import Dealer


@admin.register(Dealer)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ['id', 'brand', 'name', 'city', 'address', 'phone', 'site']

    class Meta:
        model = Dealer
