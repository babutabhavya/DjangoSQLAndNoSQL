from django.db import models


class Category(models.Model):
    text = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = "Categories"
