FROM php:apache
LABEL maintainer="Joe Tan <joe.tan@cyberark.com>"
LABEL description="CityApp based on Apache and PHP"
RUN docker-php-ext-install pdo_mysql && echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
COPY index.php /var/www/html/
sed -i 's/80/8080/' /etc/apache2/ports.conf
sed -i 's/80/8080/' /etc/apache2/sites-available/000-default.conf
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/apache2-foreground"]
