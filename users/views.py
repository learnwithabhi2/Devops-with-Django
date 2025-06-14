from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect
from .models import User



def home(request):
    if request.method == 'POST':
        username = request.POST['username'].strip()
        email = request.POST['email'].strip()

        User.objects.create(username=username, email=email)
        return redirect('/')

    users = User.objects.all()
    return render(request, 'home.html', {"users": users})

