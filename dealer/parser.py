import json

from lxml import html
import requests

from .models import Brand, Region, City, Dealer
from .cities import REGION_LIST, CITY_LIST


class Parser:
    """
    @brief: Car dealers parser
    """
    def __init__(self):
        """
        @brief: Class constructor. Add regions and cities to database
        """
        # Add regions
        for code, name in enumerate(REGION_LIST, 1):
            region, _ = Region.objects.get_or_create(name=name, id=code)

        # Add cities
        for name, region_id in CITY_LIST.items():
            City.objects.get_or_create(name=name, region=Region(pk=region_id))

    @staticmethod
    def get_text(node, path):
        """
        @brief: Get HTML node text
        @param node: Parent HTML node
        @param path: Element XPath
        @return: Node text
        """
        return node.xpath(path)[0].text.strip()

    # pylint: disable=too-many-arguments
    @staticmethod
    def insert_value(brand, city, dealer, address, phone, site):
        """
        @brief: Insert new value to database
        @param brand: Brand name
        @param city: Dealer city
        @param dealer: Dealer name
        @param address: Dealer address
        @param phone: Dealer phone
        @param site: Dealer site
        """
        brand, _ = Brand.objects.get_or_create(name=brand)
        city, _ = City.objects.get_or_create(name=city.replace('ё', 'е').strip())
        Dealer.objects.create(brand=brand, city=city, name=dealer, address=address,
                              phone=phone, site=site)

    def parse_hyundai(self):
        """
        @brief: Parse Hyundai dealers from `http://www.hyundai.ru`
        """
        # Clear `Hyundai` records
        brand = 'Hyundai'
        Dealer.objects.filter(brand__name=brand).delete()

        # Get {`ID`: `CITY NAME`} cities dictionary
        city_dict = {}
        # Get `Find dealers` page content
        response = requests.get('http://www.hyundai.ru/find-dealer')
        tree = html.fromstring(response.text)
        # Find list of cities
        cities = tree.xpath('//div[contains(@class, "nano")]//li')
        for city in cities:
            name = city.text
            for code in city.get('data-value').split(','):
                city_dict[code] = name

        # Get list of dealers (API request)
        response = requests.get('http://www.hyundai.ru/request/getalldealers')
        dealers = json.loads(response.text)
        for dealer in dealers:
            name = dealer['name'].replace('<span>', '').replace('</span>', '')
            city = city_dict.get(dealer['city_id'], '')
            address = dealer['address']
            phone = dealer['phone'].strip().replace('+ 7', '+7').replace('+7(', '+7 (')
            site = dealer['site']
            self.insert_value(brand, city, name, address, phone, site)

    def parse_kia(self):
        """
        @brief: Parse Kia dealers from `https://www.kia.ru`
        """
        # Clear `Kia` records
        brand = 'Kia'
        Dealer.objects.filter(brand__name=brand).delete()

        # Get `Dealers` page content
        response = requests.get('https://www.kia.ru/dealers/')
        tree = html.fromstring(response.text)

        # Find blocks with dealers info
        cities = tree.xpath('//div[contains(@class, "toggable")]')
        for city in cities:
            city_name = self.get_text(city, './/*[@class = "city"]') \
                            .replace('и МО', 'и Подмосковье')
            dealers = city.xpath('.//div[contains(@class, "one-dealer")]')
            for dealer in dealers:
                name = self.get_text(dealer, './/*[@class = "dealer-name"]')
                address = self.get_text(dealer, './/*[@class = "adress"]')[7:]
                phone = self.get_text(dealer, './/*[@class = "phone"]/a')
                site = self.get_text(dealer, './/*[@class = "site"]/a')

                self.insert_value(brand, city_name, name, address, phone, site)
