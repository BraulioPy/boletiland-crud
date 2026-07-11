#!/bin/bash
set -e

# apartir de aqui pongo mis comando de inicio que mi app llega a necesitar para funcionar correctamente
# como ( composer install, php artisan migrate, etc.. ) 
composer install --no-interaction --optimize-autoloader
npm install
php artisan key:generate

# 4. Asegurar que los permisos sean correctos (Muy importante en Docker)
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Mantiene vivo el proceso en apache, esperando un docker composer stop o algo parecido
exec apache2-foreground