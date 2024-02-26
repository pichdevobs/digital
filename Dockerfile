FROM debian

RUN apt update && apt -y install apache2
WORKDIR /var/www/html
COPY . ./

EXPOSE 80
CMD apachectl -D FOREGROUND





























