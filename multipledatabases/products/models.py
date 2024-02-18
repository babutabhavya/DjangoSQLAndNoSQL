from django.db import models

# Create your models here.


from django.db import models


class Product(models.Model):
    title = models.CharField(max_length=200)

    def __str__(self):
        return self.title

    class Meta:
        app_label = "products"