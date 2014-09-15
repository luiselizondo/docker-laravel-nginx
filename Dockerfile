FROM luis/nginx-php

MAINTAINER Luis Elizondo "lelizondo@gmail.com"

# Update system
RUN apt-get update

# Run composer and download laravel to /var/www/app
RUN composer create-project laravel/laravel /var/www/app --prefer-dist
RUN chown -R www-data:www-data /var/www/app

# Replace the nginx default file that comes with luis/nginx-php
ADD ./config/default /etc/nginx/sites-available/default

EXPOSE 80

WORKDIR /var/www

CMD ["/usr/bin/supervisord", "-n"]