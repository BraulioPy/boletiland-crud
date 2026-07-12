#!/bin/bash

# Si el archivo .env no existe, lo creamos desde el ejemplo
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Si la variable APP_KEY está vacía o el archivo .env no tiene llave
if [ -z "$(grep APP_KEY= .env | cut -d '=' -f2)" ]; then
    php artisan key:generate
fi

# Ejecutamos el comando original (Apache)
apache2-foreground