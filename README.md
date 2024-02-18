# DjangoSQLAndNoSQL

DjangoSQLAndNoSQL is a Django project that combines the power of MySQL and MongoDB as backend databases using Django Rest Framework. This project is specifically designed to store product-related data in MongoDB, while managing other types of data in MySQL. It also provides the flexibility to establish relations between MySQL and MongoDB.

## Prerequisites

- Python 3.11
- Pipenv

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/babutabhavya/DjangoSQLAndNoSQL.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd DjangoSQLAndNoSQL
    ```

3. **Activate the virtual environment:**

    ```bash
    pipenv shell
    ```

4. **Install dependencies using Pipenv:**

    ```bash
    pipenv install
    ```

5. **Make migrations to set up the database schema:**

    ```bash
    python manage.py makemigrations
    ```

5. **Apply migrations to set up the database schema:**

    ```bash
    python manage.py migrate
    ```


6. **Create super user to manage the admin panel:**

    ```bash
    python manage.py createsuperuser
    ```

7. **Run the development server:**

    ```bash
    python manage.py runserver
    ```

The project should now be accessible at `http://localhost:8000/`.

## Configuration

### Database Settings

- MySQL settings can be configured in the `settings.py` file under the `DATABASES` section.

    ```python
    {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "poc",
        "PASSWORD": "",
        "USER": "root",
        "HOST": "localhost",
        "PORT": "3306",
    }
    ```
- Have a MySQL with a user root, no password and a database called poc running on your localhost

- MongoDB settings can be configured in the same `settings.py` file under the `MONGODB` section.

    ```python
    MONGODB = {
        "ENGINE": "djongo",
        "NAME": "poc-prodrducts",
    }
    ```
- Have a MongoDB with a database name poc-prodrducts running

### Relations

Relations between MySQL and MongoDB can be established using Django models and their corresponding fields. For example, you can create a `ForeignKey` field in a either model that references an object in another database. For this POC, I have created a relationship between a Product in MongoDB, referencing a Category in MySQL.

## Database Routing Configuration
In the settings.py file, there is a configuration for the database routers to use the ProductRouter for managing database operations related to the 'products' app. The ProductRouter class, defined in products.routers, ensures that read, write, relations, and migrations are handled appropriately for the 'products' app, directing operations to the 'mongodb' database when needed.

## Contributing

Feel free to contribute by opening issues, providing feedback, or submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
