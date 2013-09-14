from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt

from django.http import HttpResponse

@csrf_exempt
def register(request):
  print "register"
  username = request.POST.get('username')
  password = request.POST.get('password')
  if username and password:
    user = User.objects.create_user(username, password=password)
    if user:
      user.save()
      user = authenticate(username=username, password=password) 
      auth_login(request, user)
      return HttpResponse("Registered and logged in")
    else:
      return HttpResponse("Not Registered")
  else:
    return HttpResponse("No post data")

@csrf_exempt
def login(request):
  username = request.POST['username']
  password = request.POST['password']
  user = authenticate(username=username, password=password)
  if user:
    return HttpResponse("Logged in")
  else:
    return HttpResponse("Failed")
