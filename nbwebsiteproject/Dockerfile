# pull official base image
FROM python:3.10-slim-buster

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1   

# install mysql dependencies

RUN apt-get update
RUN apt-get install gcc default-libmysqlclient-dev -y
RUN apt install -y python3-pip
RUN apt install -y build-essential libssl-dev libffi-dev python3-dev
RUN pip install virtualenv
RUN /bin/bash -c  "virtualenv nbenv"
RUN /bin/bash -c "source nbenv/bin/activate"
RUN pip install mysqlclient
RUN pip install django
# install dependencies
RUN pip install -U pip setuptools wheel
RUN pip install --upgrade pip

COPY . .

RUN apt update && apt -y upgrade

RUN /bin/sh -c pip install --no-cache-dir -r requirements.txt

RUN /bin/sh -c python manage.py makemigrations
RUN /bin/sh -c python manage.py migrate


EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

#docker run --env-file env django-polls:v0 sh -c "python manage.py makemigrations && python manage.py migrate"

