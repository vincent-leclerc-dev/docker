FROM arm32v7/php:7.1-apache-jessie

RUN apt-get update

#install utils commands
RUN apt-get install -y --no-install-recommends wget curl python python-dev git zip unzip zlib1g-dev libicu-dev g++ 

#install gpio prerequisites
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN pip install wheel

RUN pip install RPi.GPIO

RUN yes | pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
    
#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# replace shell with bash so we can source files
#RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#install apache2 modules
RUN a2enmod rewrite