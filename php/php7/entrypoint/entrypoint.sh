#!/bin/bash

echo "-*-*-*-*-  SET PERMISSIONS FOR PHP-FPM -*-*-*-*- "
usermod -o -u 1000 www-data || true
echo " !!! SET usermod FOR PHP-FPM DONE"
groupmod -o -g 1000 www-data || true
echo " !!! SET groupmod FOR PHP-FPM DONE"
echo " -*-*-*-*- SET PERMISSIONS FOR PHP-FPM DONE -*-*-*-*- "

php-fpm
