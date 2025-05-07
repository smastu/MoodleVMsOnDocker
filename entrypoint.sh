#!/bin/bash
set -e

# Arreglar permisos
git config --global --add safe.directory /var/www/moodle

# Comprobar si está Moodle clonado del repo GIT
if [ ! -d "/var/www/moodle/.git" ]; then
    echo "Moodle no descargado, clonando del repo git"
    git clone --depth=1 -b MOODLE_405_STABLE https://github.com/moodle/moodle.git /var/www/moodle
    chown -R www-data:www-data /var/www/moodle
    chmod -R 755 /var/www/moodle
fi

# Lanzar PHP-FPM
exec docker-php-entrypoint php-fpm