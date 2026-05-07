from django.shortcuts import render
from django.http import JsonResponse

def home(request):
    return JsonResponse({"message": "CrabGator API is running"})

def health(request):
    return JsonResponse({"status": "ok"})
