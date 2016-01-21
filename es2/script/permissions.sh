#!/bin/bash

usermod -o -u 1000 elasticsearch || true
groupmod -o -g 1000 elasticsearch || true

echo "!!!!! CH-MODDDED ES2 ES2 ES2 ES2 ES2 ES2 ES2 ES2 ES2 ES2 ES2 ES2 !!!!!!!!"

/bin/bash -c 'usermod -u 1000 elasticsearch; gosu elasticsearch elasticsearch'
