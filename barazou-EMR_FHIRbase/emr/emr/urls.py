"""emr URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
]

## Views
## GET requests 
# Read: GET [base]/[type]/[id]
# vRead: GET [base]/[type]/[id]/_history/[vid]
# History: GET [base]/[type]/[id]/_history
#          GET [base]/[type]/_history
#          GET [base]/_history
# Search: GET [base]/[type]
# Capabilities: GET [base]/metadata

## PUT requests
# Update: PUT [base]/[type]/[id]
# Conditional update: PUT [base]/[type]/?[params]

## PATCH requests
# Patch: PATCH [base]/[type]/[id]

## DELETE requests
# Delete: DELETE [base]/[type]/[id]
# Conditional delete: DELETE [base]/[type]/?[params]

## POST requests
# Create: POST [base]/[type]
# Search: POST [base]/[type]/_search
# Batch: POST [base]
