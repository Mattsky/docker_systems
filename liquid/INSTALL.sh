#!/bin/bash

# Installer to set up a Docker dev environment with:
# CentOS 6
# PHP 5.4.16
# drush preinstalled

# Maintainer: Matt North <matt@appnovation.com>
# Last revision date: 15/2/16

# Create "public" directory if it doesn't exist

if [ ! -d ./public ] 
then
    mkdir ./public
fi

# Grab Drupal files and set up environment
cd ./public ; wget https://ftp.drupal.org/files/projects/drupal-7.42.tar.gz ; tar --strip-components=1 -xzf drupal-7.42.tar.gz ; /bin/rm drupal-7.42.tar.gz
mkdir -p sites/default/files
chmod 777 sites/default/files
cp sites/default/default.settings.php sites/default/settings.php


# Docker magic
cd ../ 
docker-compose up -d

#Wait a bit for MariaDB to initialise...
sleep 15

# Final site install steps
docker exec -i liquid_web_1 sh -c "export PATH=/opt/rh/php54/root/usr/bin:/opt/rh/php54/root/usr/sbin:/usr/local/sbin:$PATH ; cd /var/www/html ; drush -y si standard --db-url=mysql://drupal:password@192.168.99.100/drupal --site-name=Liquid --account-name=admin --account-pass=admin"
