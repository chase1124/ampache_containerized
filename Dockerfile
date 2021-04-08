FROM debian:stretch
#Cannot get php-mcrypt package
#FROM debian:buster
#from debian:buster-slim
# Necessary system utils
RUN apt-get update && apt-get install -y less vim tcpdump net-tools
# php7.3 on buster
#RUN apt-get update && apt-get install -y nginx mariadb-server php7.3 php7.3-mbstring php-mysql php7.3-gd php7-mcrypt php7.3-mysql php7.3-cli php7.3-curl php7.3-xml ffmpeg links git
RUN apt-get update && apt-get install -y nginx mariadb-server php7.0 php7.0-mbstring php-mysql php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-cli php7.0-curl php7.0-xml ffmpeg links git
#This won't work in a container...
#RUN service mysql start
RUN echo "[mysqld]" >> /etc/mysql/my.cnf
RUN echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf
RUN service mysql start && mysql --user=root -e "create database ampache;"
RUN service mysql start && mysql --user=root -e "grant all privileges on *.* to 'chasejam'@'%' identified by 'test';"
#CMD service mysql start && tail -f /var/log/mysql/error.log
#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD /usr/bin/mysqld_safe
EXPOSE 3386
