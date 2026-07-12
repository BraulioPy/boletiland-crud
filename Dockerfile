# ETAPA 1: Dependencias PHP
FROM composer:2.10.1 AS composer_build
WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader

# ETAPA 2: Dependencias Node
FROM node:24 AS node_build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# ETAPA 3: Imagen final
FROM php:8.4-apache
RUN apt-get update && apt-get install -y libpng-dev libonig-dev libxml2-dev zip unzip
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
WORKDIR /var/www/html
COPY . .
COPY --from=composer_build /app/vendor ./vendor
COPY --from=node_build /app/public/build ./public/build
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
# Apache necesita que el DocumentRoot apunte a la carpeta /public de Laravel
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf
EXPOSE 80
# La imagen oficial ya arranca apache, no necesitas CMD extra.