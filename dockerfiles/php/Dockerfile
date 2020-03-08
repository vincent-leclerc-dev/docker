FROM php:5.6-apache-jessie

RUN apt-get update

#install utils commands
RUN apt-get install -y --no-install-recommends curl git zip unzip zlib1g-dev libicu-dev g++

#install php extensions
RUN docker-php-ext-install opcache
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install sockets

#install and enable xdebug (2.5.5 max version for php 5.6)
RUN yes | pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
    
#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

#install apache2 modules
RUN a2enmod rewrite
RUN a2enmod headers