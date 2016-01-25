#!/bin/bash

read -p "Is this a good question (s/l)? " answer
case ${answer:0:1} in
    s|S )
        echo Symfony; framework_suffix="symfony";
    ;;
    * )
        echo Laravel; framework_suffix="laravel";
    ;;
esac

read -p "Enter hostname (e.g. blog.dev):" hostname_var

# input_variable="match.dev";
echo "Entry into /etc/hosts will be:";
echo "192.168.99.100 $hostname_var";

grep -q -F "192.168.99.100 $hostname_var" /etc/hosts || echo "192.168.99.100 $hostname_var" >> /etc/hosts;

echo "Config will be called:";
echo "vhost_$framework_suffix_$hostname_var.conf";

sed -i.bkp -e "s/root \/var\/www\/html\/.*\/web;/root \/var\/www\/html\/$input_variable\/web;/g" nginx/vhost_symfony.conf >> nginx/vhost_$framework_suffix_$hostname_var.conf;
sed -i.bkp -e "s/nginx\/vhost_.*.conf:\/etc\/nginx\/conf.d\/default.conf/nginx\/vhost_$framework_suffix_$hostname_var.conf:\/etc\/nginx\/conf.d\/default.conf/g" docker-compose.yml;


