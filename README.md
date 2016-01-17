Quick start
-----------

Git clone

chmod's

uncomment needed ones

compose up

If MySQL connection drops, restart compose. For some reason it works ok after reboot.

Run composer to initiate you projects. Or git clone ;)

If you want to change you PHP version
-------------------------------------

Usefull commands
----------------

Cleanup after this repo compose containers:

`docker rm $(docker ps -a | grep dockercomposephp_ | awk '{print $1;}')`

Cleanup all non running containers:

`docker rm $(docker ps -a | grep Created | awk '{print $1;}')`


Clean all compose containers:
`docker-compose rm $(docker-compose ps | grep Exit | awk '{print $1;}')`


Good links:

CLI PHP7: https://hub.docker.com/r/rocketgraph/docker-nginx-php/~/dockerfile/

ES plugins in Docker: https://gist.github.com/benjamin-smith/78d330e08994fb5ce0de

http://blog.jez.io/2015/07/12/docker-tips-and-cheatsheet/

http://www.codedependant.net/2015/01/17/install-elastic-search-plugins-through-docker/

https://sandro-keil.de/blog/2015/10/05/docker-php-xdebug-cli-debugging/

https://github.com/devigner/docker-compose-php
