# Bazinis atvaizdas (Linux Debian versija Jessie).
FROM php:7.0.2-fpm

# Kas atsakingas už konteinerio prieziura.
MAINTAINER "Lukas Mikelionis" <lmikelionis@gmail.com>

# Install base.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y curl vim wget

# Download source and signature
RUN curl -SL "http://php.net/get/php-7.0.2.tar.gz/from/this/mirror" -o php7.tar.gz
RUN curl -SL "http://php.net/get/php-7.0.2.tar.gz.asc/from/this/mirror" -o php7.tar.gz.asc

# Verify file
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763"
RUN gpg --verify php7.tar.gz.asc php7.tar.gz

# Install tools for compile
RUN apt-get install -y build-essential libxml2-dev libcurl4-gnutls-dev libpng-dev libmcrypt-dev libxslt-dev libicu-dev libssl-dev libbz2-dev libjpeg-dev autoconf

# Uncompress
RUN tar zxvf php7.tar.gz

ENV PHP_VERSION 7.0.2

ENV PHP_FPM_INI_DIR /usr/local/etc/php

RUN mkdir -p $PHP_FPM_INI_DIR/conf.d
RUN mkdir -p $PHP_FPM_INI_DIR/pool.d

RUN cd php-7.0.2 && \
    ./configure \
    --with-config-file-path="$PHP_FPM_INI_DIR" \
    --with-config-file-scan-dir="$PHP_FPM_INI_DIR/conf.d" \
    --with-libdir=/lib/x86_64-linux-gnu \
    --enable-mysqlnd \
    --enable-intl \
    --enable-mbstring \
    --enable-zip \
    --enable-exif \
    --enable-pcntl \
    --enable-bcmath \
    --enable-ftp \
    --enable-exif \
    --enable-calendar \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --enable-sockets \
    --enable-opcache \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-fpm \
    --disable-cli \
    --with-fpm-user=www-data \
    --with-fpm-group=www-data \
    --with-curl \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --with-openssl \
    --with-xsl \
    --with-gd \
    --with-mcrypt \
    --with-iconv \
    --with-bz2 \
    --with-mhash \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    --with-zlib && \
    make -j"$(nproc)" && \
    make install && \
    make clean

# Install Xdebug
RUN curl -SL "http://xdebug.org/files/xdebug-2.4.0rc2.tgz" -o xdebug.tgz
RUN tar zxvf xdebug.tgz

RUN cd xdebug-2.4.0RC2 && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012

CMD ["php-fpm"]
