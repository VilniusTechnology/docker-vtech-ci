Quick start
-----------

Aparently do: Git clone


chmod's your mapping dirs permissions
=====================================

/docker-php5full/fpm-conf
/docker-php5full/ini
/mysql/databases


docker-machine restart



compose up

If MySQL connection drops, restart compose. For some reason it works ok after reboot.

Run composer to initiate you projects. Or git clone ;)

If you want to change you PHP version
-------------------------------------

uncomment needed php versions

To Uses PHP7 in docker-compose.yml you should uncomment: ``
And change `` to respective paths. 

If you want to use PHP5 just leave

Usefull commands
----------------

Cleanup after this repo compose containers:

`docker rm $(docker ps -a | grep dockercomposephp_ | awk '{print $1;}')`

Cleanup all non running containers:

`docker rm $(docker ps -a | grep Created | awk '{print $1;}')`


Clean all compose containers:
`docker-compose rm $(docker-compose ps | grep Exit | awk '{print $1;}')`

Clean images tagged <none>:
`docker rmi -f $(docker images | grep none | awk '{print $3;}')`

If you are getting `cant connect` errors run these:
-----------------------------------------
`docker-machine restart default`
`docker-machine regenerate-certs default`

and this:
`eval $(docker-machine env default)`

Ok, worst case:
`killall -9 VBoxHeadless && docker-machine restart default`

`docker-compose up --force-recreate`

Good links:

CLI PHP7: https://hub.docker.com/r/rocketgraph/docker-nginx-php/~/dockerfile/

ES plugins in Docker: https://gist.github.com/benjamin-smith/78d330e08994fb5ce0de

http://blog.jez.io/2015/07/12/docker-tips-and-cheatsheet/

http://www.codedependant.net/2015/01/17/install-elastic-search-plugins-through-docker/

https://sandro-keil.de/blog/2015/10/05/docker-php-xdebug-cli-debugging/

https://github.com/devigner/docker-compose-php
