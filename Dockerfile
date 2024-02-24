FROM python:3.11-slim-bullseye

# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED 1

# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1


RUN mkdir /project
WORKDIR /project

# Install build-essential and other dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Pipenv
RUN pip install pipenv

# Set MySQL client environment variables

ENV MYSQLCLIENT_CFLAGS "-I/usr/include/mysql"
ENV MYSQLCLIENT_LDFLAGS "-L/usr/lib/x86_64-linux-gnu -lmysqlclient"

# Copy only Pipfile and Pipfile.lock initially to leverage Docker cache
ADD Pipfile Pipfile.lock /project/

# Install dependencies using Pipenv
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the project files
ADD . /project/
