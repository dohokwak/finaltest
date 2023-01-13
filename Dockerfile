FROM saaaaangho/ubuntu:apache2 
RUN apt-get update
COPY . /var/www/html/
EXPOSE 80
CMD [ "apache2-foreground" ]

