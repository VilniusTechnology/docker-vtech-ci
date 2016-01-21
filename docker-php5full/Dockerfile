FROM php:5.6-fpm

MAINTAINER "Lukas Mikelionis" <lukas.mikelionis@vilnius.technology>

RUN apt-get update

# Install ZIP extension
RUN apt-get install -y php-pear
RUN apt-get install -y zziplib-bin
RUN pecl install "channel://pecl.php.net/zip-1.5.0"

# Install modules
RUN apt-get install -y \
    libmcrypt-dev  \
    libicu-dev \
    mysql-client \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mysql \
    && docker-php-ext-install iconv \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mbstring

# Deploy git
RUN apt-get install -y git-all

# Install Xdebug
RUN pecl install xdebug

RUN curl -SL "http://xdebug.org/files/xdebug-2.4.0rc2.tgz" -o xdebug.tgz
RUN tar zxvf xdebug.tgz
RUN cd xdebug-2.4.0RC2 && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012

# Deploy php's dependency manager composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Deploy symfony installer.
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Deploy Laravel installer
RUN composer global require "laravel/installer"
RUN ln -s /root/.composer/vendor/bin/laravel /usr/local/bin/laravel
RUN PATH=$PATH:/root/.composer/vendor/bin

CMD ["php-fpm"]
