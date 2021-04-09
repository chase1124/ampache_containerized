FROM debian:stretch
#Cannot get php-mcrypt package
#FROM debian:buster
#from debian:buster-slim
# Necessary system utils
RUN apt-get update && apt-get install -y less vim tcpdump net-tools
# php7.3 on buster
#RUN apt-get update && apt-get install -y nginx mariadb-server php7.3 php7.3-mbstring php-mysql php7.3-gd php7-mcrypt php7.3-mysql php7.3-cli php7.3-curl php7.3-xml ffmpeg links git
RUN apt-get update && apt-get install -y nginx mariadb-server php7.0 php7.0-mbstring php-mysql php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-cli php7.0-curl php7.0-xml ffmpeg links git
RUN echo "[mysqld]" >> /etc/mysql/my.cnf
RUN echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf
COPY db_init.sh ./
RUN service mysql start && sh db_init.sh
#RUN service mysql start && mysql --user=root -e "create database ampache;"
#COPY ampache.sql ./
#RUN service mysql start && mysql --user=root ampache < ampache.sql 
#RUN service mysql start && mysql --user=root -e "grant all privileges on ampache.* to 'ampache_user'@'%' identified by '12test34';"
#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD /usr/bin/mysqld_safe
EXPOSE 3306
