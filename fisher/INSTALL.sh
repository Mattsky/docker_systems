#!/bin/bash

# Installer to set up a Docker dev environment with:
# CentOS 7
# PHP 5.6+
# drush preinstalled

# Maintainer: Matt North <matt@appnovation.com>
# Last revision date: 16/2/16

# Create "public" directory if it doesn't exist

if [ ! -d ./public ] 
then
    mkdir ./public
fi

# Grab Drupal files and set up environment
cd ./public ; wget https://ftp.drupal.org/files/projects/drupal-8.0.3.tar.gz ; tar --strip-components=1 -xzf drupal-8.0.3.tar.gz ; /bin/rm drupal-8.0.3.tar.gz
mkdir -p sites/default/files
chmod 777 sites/default/files
cp sites/default/default.settings.php sites/default/settings.php


# Docker magic
cd ../ 
docker-compose up -d

#Wait a bit for MariaDB to initialise...
sleep 15

# Final site install steps
docker exec -i fisher_web_1 sh -c "cd /var/www/html ; drush -y si standard --db-url=mysql://drupal:password@192.168.99.100/drupal --site-name=Fisher --account-name=admin --account-pass=admin"

# Disable CSS & JS aggregation to make sure themes load properly
cd ./public/sites/default
chmod 777 settings.php
echo "\$config['system.performance']['css']['preprocess'] = FALSE;" >> ./settings.php
echo "\$config['system.performance']['js']['preprocess'] = FALSE;" >> ./settings.php

