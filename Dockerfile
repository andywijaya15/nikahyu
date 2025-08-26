FROM composer:2 AS composer_stage

FROM dunglas/frankenphp:latest

RUN install-php-extensions \
    pdo_pgsql \
    bcmath \
    intl \
    opcache \
    pcntl \
    zip

COPY --from=composer_stage /usr/bin/composer /usr/local/bin/composer

WORKDIR /app

EXPOSE 80 443 443/udp

CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]