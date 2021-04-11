FROM debian:buster
# Necessary system utils
RUN apt-get update && apt-get install -y less vim tcpdump net-tools
RUN apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list
RUN apt-get update && apt-get install -y nginx php7.4 php7.4-mbstring php-mysql php7.4-gd php7.4-mysql php7.4-cli php7.4-curl php7.4-xml php7.4-mcrypt php7.4-intl php7.4-fpm ffmpeg links git
COPY source/ampache /var/www/html/ampache/
COPY composer.phar /var/www/html/ampache/composer
RUN chmod +x /var/www/html/ampache/composer
RUN cd /var/www/html/ampache/ && /var/www/html/ampache/composer install --prefer-source --no-interaction
COPY ampache.cfg.php-installed /var/www/html/ampache/config/ampache.cfg.php
COPY nginx.conf /etc/nginx/sites-enabled/ampache.conf
RUN rm /etc/nginx/sites-enabled/default
RUN mkdir /var/log/ampache && chown -R www-data /var/log/ampache/
RUN chown -R www-data /var/www/html/ampache/
RUN mkdir -p /ampache/music
#COPY music/* /ampache/music/
#RUN chown -R www-data /ampache/music
#CMD ["nginx","-g","daemon off;"]
CMD /etc/init.d/php7.4-fpm start && nginx -g 'daemon off;'
EXPOSE 80
