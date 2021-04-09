FROM debian:buster
# Necessary system utils
RUN apt-get update && apt-get install -y less vim tcpdump net-tools
RUN apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list
RUN apt-get update && apt-get install -y nginx php7.4 php7.4-mbstring php-mysql php7.4-gd php7.4-mysql php7.4-cli php7.4-curl php7.4-xml php7.4-mcrypt php7.4-intl php7.4-fpm ffmpeg links git
COPY ampache /var/www/html/ampache/
COPY tools/composer.phar /var/www/html/ampache/composer
RUN chmod +x /var/www/html/ampache/composer
#RUN cd /var/www/html/ampache/ && /var/www/html/ampache/composer install --prefer-source --no-interaction
RUN cp /var/www/html/ampache/config/ampache.cfg.php.dist /var/www/html/ampache/config/ampache.cfg.php
COPY conf/nginx.conf /etc/nginx/sites-enabled/ampache.conf
RUN mkdir /var/log/ampache
CMD ["nginx","-g","daemon off;"]
