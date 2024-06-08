from django.db import models


class Category(models.Model):
    text = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)

    def __str__(self) -> str:
        return self.text

    class Meta:
        verbose_name_plural = "Categories"
