#!/bin/bash

echo "SET PERMISSIONS FOR PHP-FPM"

usermod -o -u 1000 www-data || true
groupmod -o -g 1000 www-data || true

echo "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
echo "WILL launch: supervisord -c /etc/supervisor/conf.d/supervisord.conf"
echo "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"

supervisord -c /etc/supervisor/conf.d/supervisord.conf
