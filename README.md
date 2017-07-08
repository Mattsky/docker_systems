Bunch of containers for different combinations of OS and projects.

Current setups available:

- Liquid - CentOS 6, Drupal 7, PHP 5.4
- Solid - CentOS 6, Drupal 8, PHP 5.5.9+

- Archer - CentOS 7, Drupal 7, PHP 5.4
- Fisher - CentOS 7, Drupal 8, PHP 5.5.9+

- Wagner - Ubuntu 12.04 LTS, PHP5.6, Drupal 7
- Snow - Ubuntu 12.04 LTS, PHP5.6, Drupal 8 (TBD)

- Laravel - CentOS 7, PHP5.6+, Composer and Laravel preinstalled.

- Apache-test - Debian 8 based Apache PHP Docker image with extensions installed specifically for Drupal 8 (see HOWTO below)

HOWTO:

- Clone project
- Run INSTALL.sh (may need to set as executable) and wait for the systems to start.
- Drupal: connect at 192.168.99.100, credentials are admin/admin.
- Laravel: connect at 192.168.99.100/laravel for the default preinstalled project.

- Apache-test: this is designed to be used as the image for the webserver container in the https://github.com/Mattsky/Demo-systems/tree/master/Kubernetes deployment definition.

NOTES:

- The directory you clone these projects into will have a "public" subdirectory created when you run the INSTALL.sh script. This mounts as /var/www/html on the webserver container so you can edit things in real time.
- Only one webserver can run at a time as they each want port 80 on the host. You can change the ports in the docker-compose.yml files.
