#!/bin/bash

# Installer to set up a Laravel dev environment with:
# CentOS 7
# PHP 5.6+
# Laravel & Composer preinstalled

# Maintainer: Matt North <matt@appnovation.com>
# Last revision date: 15/2/16

# Create "public" directory if it doesn't exist

if [ ! -d ./public ] 
then
    mkdir ./public
fi

# Docker magic
cd ../ 
docker-compose up -d

#Wait a bit for MariaDB to initialise...
sleep 15

# Final site install steps
docker exec -i laravel_web_1 sh -c " cd /var/www/html ; /root/.composer/vendor/bin/laravel new laravel ; chown -R apache: /var/www/html"
