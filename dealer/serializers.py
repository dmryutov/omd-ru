from rest_framework import serializers

from .models import Dealer


class DealerSerializer(serializers.ModelSerializer):
    brand = serializers.StringRelatedField()
    city = serializers.StringRelatedField()

    class Meta:
        model = Dealer
        fields = ['brand', 'city', 'name', 'address', 'phone', 'site']
