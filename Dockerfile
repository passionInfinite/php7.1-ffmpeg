FROM php:7.1-cli

MAINTAINER passioninfinite <passioninfinite1795@gmail.com>

#Update
RUN apt-get update

#Install unzip
RUN apt-get install -y unzip

#Install mongodb
RUN pecl install mongodb

#Enable mongodb extension
RUN docker-php-ext-enable mongodb

#Installing dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        unixodbc-dev \
        libxml2-dev \
        libaio-dev \
        libmemcached-dev \
        freetds-dev \
	libssl-dev

#Installing Extensions
RUN docker-php-ext-install gd

#Install zip extension
RUN docker-php-ext-install zip

#Install socket extension
RUN docker-php-ext-install sockets

#Update 
RUN apt-get update

#Install FFmpeg
RUN apt-get install ffmpeg -y

#Check FFmpeg version
RUN ffmpeg -version

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Print Composer version
RUN composer --version

