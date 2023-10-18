FROM php:8.1-fpm-alpine3.17

ARG user=www-data
ARG group=www-data
ENV PROJECT_DIR=/app \
    APP_PORT=8080

RUN apk add --no-cache $PHPIZE_DEPS \
    gcc g++ autoconf make pkgconfig git openssl \
    libpng-dev libzip libzip-dev \
    libressl curl-dev zip unzip supervisor nginx bash \
    && docker-php-ext-install sockets gd zip \
    && apk del --no-cache $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./etc/docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./etc/docker/php/www.conf /usr/local/etc/php-fpm.conf 
COPY ./etc/docker/supervisor/supervisord.conf /etc/supervisord.conf

WORKDIR $PROJECT_DIR

COPY --chown=${group}:${user} . .

# Descomentar cuando se tenga un proyecto con las librerias a instalar (composer.json)
#RUN composer install --ignore-platform-reqs --no-scripts

RUN mkdir -p /run/nginx /run/supervisor /run/php /app/storage \
    && chown -R ${group}:${user} /run/nginx /run/supervisor /run/php /app/storage 

EXPOSE $APP_PORT
HEALTHCHECK CMD curl --fail http://localhost:$APP_PORT || exit

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
