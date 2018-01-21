from django.db import models


class Brand(models.Model):
    name = models.CharField(max_length=50, null=False)

    class Meta:
        verbose_name = 'Марка'
        verbose_name_plural = 'Марки'

    def __str__(self):
        return self.name


class Region(models.Model):
    name = models.CharField(max_length=50, null=False)

    class Meta:
        verbose_name = 'Федеральный округ'
        verbose_name_plural = 'Федеральные округа'

    def __str__(self):
        return self.name


class City(models.Model):
    region = models.ForeignKey(Region, default=None, null=True, blank=True,
                               on_delete=models.SET_NULL, related_name='region')

    name = models.CharField(max_length=50, null=False)

    class Meta:
        verbose_name = 'Город'
        verbose_name_plural = 'Города'

    def __str__(self):
        return self.name


class Dealer(models.Model):
    brand = models.ForeignKey(Brand, null=False, related_name='brand', on_delete=models.CASCADE)
    city = models.ForeignKey(City, null=False, related_name='city', on_delete=models.CASCADE)

    name = models.CharField(max_length=50, null=False)
    address = models.TextField(null=False)
    phone = models.CharField(max_length=255, default=None, null=True, blank=True)
    site = models.URLField(default=None, null=True, blank=True)

    class Meta:
        verbose_name = 'Дилер'
        verbose_name_plural = 'Дилеры'
        permissions = (
            ('manager_central', 'Города Центрального и Северо-Западного ФО РФ'),
            ('manager_south', 'Города Южного, Приволжского и Северо-Кавказского ФО РФ'),
            ('manager_east', 'Города Уральского, Сибирского и Дальневосточного ФО РФ'),
        )

    def __str__(self):
        return self.name
