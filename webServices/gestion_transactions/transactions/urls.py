from django.urls import path
from .soap_views import CreateTransaction
from .wsdl_view import wsdl_view
urlpatterns = [
    path('soap/', CreateTransaction, name='soap'),  
    path('wsdl/', wsdl_view, name='wsdl'), 
]
