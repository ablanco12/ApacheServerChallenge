FROM ubuntu 
RUN apt update
RUN apt install apache2 -y
RUN apt install apache2-utils -y 
RUN apt upgrade -y
COPY index.html /var/www/html/
EXPOSE 80
ENTRYPOINT ["apache2ctl"]
CMD ["-D","FOREGROUND"]
