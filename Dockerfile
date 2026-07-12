# ETAPA 1: Dependencias PHP
FROM php:8.4-cli-alpine AS composer_build
# Instalar herramientas para compilar extensiones
RUN apk add --no-cache libpng-dev libzip-dev zip unzip
RUN docker-php-ext-install gd zip

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-dev --optimize-autoloader --no-scripts

# ETAPA 2: Dependencias Node
FROM node:24 AS node_build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# ... (etapas previas igual)

# ETAPA 3: Imagen final
FROM php:8.4-apache
RUN apt-get update && apt-get install -y libpng-dev libonig-dev libxml2-dev zip unzip git
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Instalar Composer directamente en la imagen final
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . .

# INSTALA AQUÍ DENTRO DE LA IMAGEN FINAL
RUN composer install --no-dev --optimize-autoloader --no-scripts
# Copiar assets de Node
COPY --from=node_build /app/public/build ./public/build

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf
EXPOSE 80