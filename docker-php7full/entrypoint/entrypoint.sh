#!/bin/bash

echo "SET PERMISSIONS FOR PHP-FPM"

usermod -o -u 1000 www-data || true
groupmod -o -g 1000 www-data || true

echo "SET PERMISSIONS FOR PHP-FPM DONE"

php-fpm