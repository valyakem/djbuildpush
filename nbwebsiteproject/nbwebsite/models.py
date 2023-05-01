from django.db import models

# Create your models here.
class Menulevelone(models.Model):
    nbmenudesc = models.CharField(max_length=25)

    def __str__(self):
        return self.nbmenudesc

class Smenulevelone(models.Model):
    nbsubmenuone = models.CharField(max_length=25)
    menulevelone = models.ForeignKey(Menulevelone, on_delete=models.CASCADE)

    def __str__(self):
        return self.nbsubmenuone