from djongo import models
from categories.models import Category


class Product(models.Model):
    _id = models.ObjectIdField()
    title = models.CharField(max_length=200)
    categories = models.ForeignKey(Category, on_delete=models.CASCADE)
    description = models.TextField()
    data_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

    class Meta:
        app_label = "products"
