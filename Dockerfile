FROM ubuntu:14.04
MAINTAINER me, mofo


# Use closest Ubuntu mirror
RUN sed -i '1i deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1i deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1i deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1i deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse' /etc/apt/sources.list


#RUN apt-get update && apt-get dist-upgrae -y
RUN apt-get update 

RUN apt-get install -y python-pip

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

ENV FLASK_APP=service.py

EXPOSE 5000

CMD flask run

