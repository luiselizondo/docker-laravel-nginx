FROM luis/nginx-php

MAINTAINER Luis Elizondo "lelizondo@gmail.com"

# Update system
RUN apt-get update

# Run composer and download laravel to /var/www/app
RUN rm -Rf /var/www
RUN composer create-project laravel/laravel /var/www --prefer-dist
RUN chown -R www-data:www-data /var/www/app
RUN composer global require "phpunit/phpunit=4.2.*"

# Replace the nginx default file that comes with luis/nginx-php
ADD ./config/default /etc/nginx/sites-available/default

EXPOSE 80

WORKDIR /var/www

CMD ["/usr/bin/supervisord", "-n"]
