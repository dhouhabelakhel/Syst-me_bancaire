from django.views.decorators.csrf import csrf_exempt
from django.db import transaction as db_transaction
from django.http import HttpResponse
from zeep import Client
from lxml import etree
from lxml.etree import QName 
from .models import Compte, Transaction
from decimal import Decimal


@csrf_exempt
def CreateTransaction(request):
    wsdl = 'http://localhost:8000/transactions/wsdl/?wsdl'
    client = Client(wsdl=wsdl)

    try:
        soap_request = etree.fromstring(request.body)

        from_account_id = soap_request.findtext('.//from_account_id')
        to_account_id = soap_request.findtext('.//to_account_id')
        montant_text = soap_request.findtext('.//montant')

        if not all([from_account_id, to_account_id, montant_text]):
            return HttpResponse(create_soap_response("Requête SOAP invalide."), content_type='application/soap+xml')

        from_account_id = int(from_account_id)
        to_account_id = int(to_account_id)
        montant = Decimal(montant_text)

        from_account = Compte.objects.get(id=from_account_id)
        to_account = Compte.objects.get(id=to_account_id)

        if from_account.solde < montant:
            response = create_soap_response("Solde insuffisant")
            return HttpResponse(response, content_type='application/soap+xml')

        with db_transaction.atomic():
            transaction = Transaction.objects.create(
                from_account=from_account,
                to_account=to_account,
                montant=montant,
                confirme=True
            )
            from_account.solde -= montant
            to_account.solde += montant
            from_account.save()
            to_account.save()

        response = create_soap_response("Transaction réussie")
        return HttpResponse(response, content_type='application/soap+xml')

    except Compte.DoesNotExist:
        return HttpResponse(create_soap_response("Compte introuvable"), content_type='application/soap+xml')
    except Exception as e:
        response = create_soap_response(f"Échec de la transaction : {str(e)}")
        return HttpResponse(response, content_type='application/soap+xml')

def create_soap_response(message):
    soap_ns = 'http://schemas.xmlsoap.org/soap/envelope/'
    xsi_ns = 'http://www.w3.org/2001/XMLSchema-instance'
    xsd_ns = 'http://www.w3.org/2001/XMLSchema'
    
    envelope = etree.Element(QName(soap_ns, "Envelope"), nsmap={
        'soap': soap_ns,
        'xsi': xsi_ns,
        'xsd': xsd_ns,
    })
    
    body = etree.SubElement(envelope, QName(soap_ns, "Body"))
    response_message = etree.SubElement(body, "response")
    response_message.text = message
    
    return etree.tostring(envelope, pretty_print=True, xml_declaration=True, encoding='UTF-8')
