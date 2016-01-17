FROM php:5.6-fpm
# Install modules
RUN apt-get update && apt-get install -y \
	libmcrypt-dev  \
	libicu-dev \
	mysql-client \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install iconv \
	&& docker-php-ext-install mcrypt \
	&& docker-php-ext-install intl \
	&& docker-php-ext-install opcache \
	&& docker-php-ext-install mbstring

CMD ["php-fpm"]



# Bazinis atvaizdas (Linux Debian versija Jessie).
#FROM debian:jessie

# Kas atsakingas už konteinerio prieziura.
#MAINTAINER "Lukas Mikelionis" <lmikelionis@gmail.com>

# Install base.
#RUN \
#  apt-get update && \
#  apt-get -y upgrade && \
#  apt-get install -y curl vim wget

# Diegiame PHP5 ir Laravel5 reikalingus extensionus.
#RUN apt-get update \
#  && apt-get install -y -qq \
#      php5-fpm \
#      php5-mcrypt \
#      php5-cli \
#      php5-curl \
#      php5-mysqlnd \
#      php5-common

# Taciau, jei reikia pakoreguoti viena ar kelias eilutes, patogiau yra taip:
#RUN sed -i "s/;date.timezone =.*/date.timezone = Europe\/Vilnius/" /etc/php5/fpm/php.ini

# Install tools for compile
#RUN apt-get install php5-dev -y
#RUN apt-get install -y build-essential libxml2-dev libcurl4-gnutls-dev libpng-dev libmcrypt-dev libxslt-dev libicu-dev libssl-dev libbz2-dev libjpeg-dev autoconf

# Xdebug
#RUN apt-get -y install php5-xdebug
#RUN echo "xdebug.remote_enable=on" >> /etc/php5/fpm/conf.d/20-xdebug.ini && echo "xdebug.remote_connect_back=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini && echo "xdebug.remote_port=9010" >> /etc/php5/fpm/conf.d/20-xdebug.ini

#CMD ["/usr/sbin/php5-fpm", "-F"]
