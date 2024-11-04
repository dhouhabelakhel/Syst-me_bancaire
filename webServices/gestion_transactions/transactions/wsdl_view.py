from django.http import HttpResponse
from django.conf import settings
import os

def wsdl_view(request):
    if 'wsdl' in request.GET:
        wsdl_file_path = os.path.join(settings.BASE_DIR, 'wsdl', 'transaction.wsdl')
        try:
            with open(wsdl_file_path, 'r', encoding='utf-8') as file:
                wsdl_content = file.read()
            return HttpResponse(wsdl_content, content_type='text/xml; charset=utf-8')
        except FileNotFoundError:
            return HttpResponse("WSDL file not found.", status=404)
    return HttpResponse("Not a WSDL request.", status=404)
