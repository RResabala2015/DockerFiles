FROM php:8.1-fpm-alpine3.17

RUN apk add --no-cache $PHPIZE_DEPS \
    gcc g++ autoconf make pkgconfig git openssl \
    libressl curl-dev libpng-dev libzip libzip-dev \ 
    zip unzip supervisor nginx bash \
    && docker-php-ext-install sockets gd zip \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && apk del --no-cache $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/*

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./etc/docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./etc/docker/php/www.conf /usr/local/etc/php-fpm.conf 
COPY ./etc/docker/supervisor/supervisord.conf /etc/supervisord.conf

WORKDIR /app

COPY . .

RUN mkdir -p /run/nginx /run/supervisor /run/php /app/storage \
    && chown -R www-data:www-data /run/nginx /run/supervisor /run/php /app/storage \
    && chmod -Rf 777 /app/storage

EXPOSE 8080

RUN echo user=root>>/etc/supervisord.conf
CMD ["/usr/bin/supervisord","-n"]
