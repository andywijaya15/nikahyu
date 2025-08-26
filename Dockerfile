FROM dunglas/frankenphp:latest

RUN install-php-extensions \
    pdo_pgsql \
    bcmath \
    intl \
    opcache \
    pcntl \
    zip

WORKDIR /app

EXPOSE 80 443 443/udp

CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]