#!/bin/bash

echo "SET PERMISSIONS FOR NGINX"

usermod -o -u 1000 nginx || true
groupmod -o -g 1000 nginx || true

echo "SET PERMISSIONS FOR NGINX DONE"

nginx -g 'daemon off;'