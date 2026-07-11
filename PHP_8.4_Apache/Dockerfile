# Selecciono la imagen base que ya trae PHP y Apache instalados en la version de mi entorno
FROM php:8.4-apache

# Las extensiones de PHP necesarias para la aplicación, las puedo ver en el composer.json de mi sistema (si es que uso un framework)
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libpng-dev \
    libmbstring-dev \
    && docker-php-ext-install pdo_mysql zip gd mbstring \
    && a2enmod rewrite

# Copiamos el script de entrada al contenedor
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

# Le damos permisos de ejecución al script de entrada para poder ejecutarlo
RUN chmod +x /usr/local/bin/entrypoint.sh

# Establezco ese script como el punto de entrada del contenedor.
ENTRYPOINT ["entrypoint.sh"]

# Aqui vivira mi app, es decir, el directorio donde se copiara mi proyecto
WORKDIR /var/www/html