FROM php:7.0-fpm

RUN apt-get update \
    && apt-get -y --no-install-recommends install zlib1g-dev libmemcached-dev libmagickwand-dev libmcrypt-dev \
	&& docker-php-ext-install -j$(nproc) mbstring mysqli pdo_mysql intl soap gd mcrypt opcache zip \
	&& pecl install memcached xdebug imagick \
	&& docker-php-ext-enable memcached xdebug imagick \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN usermod -u 1000 www-data

EXPOSE 9000
