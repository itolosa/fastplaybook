#!/usr/bin/env bash
#
# Nginx - new server block

# Functions
ok() { echo -e '\e[32m'$1'\e[m'; } # Green
die() { echo -e '\e[1;31m'$1'\e[m'; exit 1; }

# Variables
NGINX_AVAILABLE_VHOSTS='/etc/nginx/sites-available'
NGINX_ENABLED_VHOSTS='/etc/nginx/sites-enabled'
WEB_DIR='/var/www'
WEB_USER='www-data'
USER='yourusername'
NGINX_SCHEME='$scheme'
NGINX_REQUEST_URI='$request_uri'

# Enable site by creating symbolic link
ln -s $NGINX_AVAILABLE_VHOSTS/$1 $NGINX_ENABLED_VHOSTS/$1

# Restart
echo "Do you wish to restart nginx?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) /etc/init.d/nginx restart ; break;;
        No ) exit;;
    esac
done

ok "Site Created for $1"