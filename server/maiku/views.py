from django.shortcuts import render
from django.conf import settings


from django.http import HttpResponse
def feed(request):
  return HttpResponse("Hey")
