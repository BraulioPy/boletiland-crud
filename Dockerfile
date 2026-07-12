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

# 1. Instalar dependencias del sistema incluyendo libzip-dev
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    libzip-dev 

# 2. Instalar extensiones PHP (añadimos zip aquí)
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# 3. Solucionar el problema de git (añade esto ANTES de cualquier comando git)
RUN git config --global --add safe.directory /var/www/html

WORKDIR /var/www/html
COPY . .

# Instalar Composer dentro de la imagen final (como acordamos antes)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copiar assets de Node
COPY --from=node_build /app/public/build ./public/build

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf
EXPOSE 80

#Etapa 4 -- KEY GENERATE SCRIPT:

# Copiar el script de entrada y darle permisos
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Definir el comando de inicio usando el script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]