from django.db import models

class Compte(models.Model):
    id = models.PositiveBigIntegerField(primary_key=True)
    RIB = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    solde = models.DecimalField(max_digits=15, decimal_places=2)
    user_id= models.PositiveBigIntegerField()
    class Meta:
        managed = False  
        db_table = 'comptes'  

class Transaction(models.Model):
    id = models.PositiveBigIntegerField(primary_key=True)
    from_account = models.ForeignKey(Compte, on_delete=models.CASCADE, related_name='outgoing_transactions', db_column='from_account')
    to_account = models.ForeignKey(Compte, on_delete=models.CASCADE, related_name='incoming_transactions', db_column='to_account')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateTimeField(auto_now_add=True)
    confirme = models.BooleanField(default=False)

    def __str__(self):
        return f"Transaction de {self.montant} de {self.from_account} à {self.to_account}"

    class Meta:
        db_table = 'transactions'

