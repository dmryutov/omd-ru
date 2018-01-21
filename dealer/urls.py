from django.conf.urls import url
from django.contrib.auth.views import logout

from . import views


urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^change_city/$', views.change_city, name='change_city'),
    url(r'^parse/$', views.parse, name='parse'),
    url(r'^logout/$', logout, {'next_page': '/'}, name='logout'),
    url(r'^login/$', views.auth, name='login'),
    url(r'^registration/$', views.registration, name='registration'),
]