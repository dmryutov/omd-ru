from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.http import JsonResponse
from django.shortcuts import redirect, render

import pandas as pd

from .models import City, Dealer
from .parser import Parser
from .serializers import DealerSerializer


def load_dealers(request):
    """
    @brief: Load dealers data and some statistics
    @param request: HTTP request
    @return: Dealer data, Statistics
    """
    data = Dealer.objects.all()
    # Check user permissions
    if not request.user.is_superuser:
        if not request.user.has_perm('dealer.manager_central'):
            data = data.exclude(city__region_id__in=[1, 2])
        if not request.user.has_perm('dealer.manager_south'):
            data = data.exclude(city__region_id__in=[3, 4, 5])
        if not request.user.has_perm('dealer.manager_east'):
            data = data.exclude(city__region_id__in=[6, 7, 8])

    # Filter data by city
    city = request.GET.get('city')
    if city:
        data = data.filter(city_id=city)

    # Calculate some statistics
    stat = pd.DataFrame.from_records(data.values('city__name', 'brand__name', 'id'))
    try:
        stat = stat.pivot_table(index='city__name', columns='brand__name',
                                values='id', aggfunc='count')
        stat = stat.fillna(0).reset_index()
    except KeyError:
        pass

    return data, stat


@login_required
def index(request):
    """
    @brief: Load home page
    @param request: HTTP request
    @return: HTTP response
    """
    # Load dealers data and some statistics
    data, stat = load_dealers(request)
    # Get cities list
    cities = data.values('city', 'city__name').order_by('city__name').distinct()
    for q in cities:
        print(q)

    return render(request, 'index.html', {
        'data': data,
        'stat': stat,
        'cities': cities
    })


@login_required
def change_city(request):
    """
    @brief: Change city event. Load dealers data
    @param request: HTTP request
    @return: HTTP response (json)
    """
    # Load dealers data and some statistics
    data, stat = load_dealers(request)
    # Serialize dealers data
    serializer = DealerSerializer(data, many=True)

    return JsonResponse({
        'data': serializer.data,
        'stat': stat.to_json(orient='records'),
    })


@login_required
def parse(request):
    """
    @brief: Parse information about car dealers
    @param request: HTTP request
    @return: HTTP response
    """
    parser = Parser()
    parser.parse_hyundai()
    parser.parse_kia()
    return redirect('index')


def auth(request):
    """
    @brief: Load login page
    @param request: HTTP request
    @return: HTTP response
    """
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('index')
    else:
        form = AuthenticationForm()
    return render(request, 'login.html', {'form': form})


def registration(request):
    """
    @brief: Load registration page
    @param request: HTTP request
    @return: HTTP response
    """
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('index')
    else:
        form = UserCreationForm()
    return render(request, 'registration.html', {'form': form})
