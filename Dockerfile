FROM python:3.11-slim-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV MYSQLCLIENT_CFLAGS "-I/usr/include/mysql"
ENV MYSQLCLIENT_LDFLAGS "-L/usr/lib/x86_64-linux-gnu -lmysqlclient"

RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    netcat

RUN pip install pipenv

WORKDIR /project

# Separate copying of Pipfile and Pipfile.lock to leverage Docker cache
COPY Pipfile Pipfile.lock ./

# Install dependencies using Pipenv
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the project files
COPY . .

RUN sed -i 's/\r$//g' ./scripts/entrypoint.sh \
    && chmod +x ./scripts/entrypoint.sh

ENTRYPOINT ["/project/scripts/entrypoint.sh"]
