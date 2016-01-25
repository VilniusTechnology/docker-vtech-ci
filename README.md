Quick start
-----------

1. Git clone `git clone git@github.com:VilniusTechnology/docker-vtech-ci.git`.

1.1. Move to projects dir: `cd docker-vtech-ci`.

2.1. Run `docker-compose up`

2.2. Check php.ini settings `http://192.168.99.100` (192.168.99.100 is default ip for default docker machine, 
on different OS'es and setups it might be different). 
Also `http://192.168.99.100/mysql.php` checks mysql connection.

2.3. If PHP5 is not good, choose uncomment desirable PHP version 
(7.0.2 currently available `vtech/docker-phpfpm7-ssh:dev`) lines.

And clear up images and containers:

`docker-compose rm `

`docker rmi -f $(docker images | grep dockervtechci_phpfpm | awk '{print $3;}') && docker-compose rm -f`

3. Git clone your PHP project into `./app` directory. Run `php composer install` if is needed.


    NOTE: If MySQL connection drops, restart compose. For some reason it works ok after reboot.
    
    NOTE: If you need to use php's composer, you can do it following way: 
    ` docker run -i -v /$(pwd)//symfony-demo:/app composer/composer install `.

Changing PHP version
--------------------

Uncomment lines containing `php7` and comment out `php5` if you need to use PHP7. And vice versa.

Rebuild images and containers. `docker-compose rm` `docker-compose up`

If you need to switch versions constantly tag them.


SSH into PHP-FPM
================

`docker port dockervtechci_phpfpm_1 22`

`docker inspect c1159e6a3498 | grep IPAddress`

`ssh root@192.168.99.100 -p 2222`

Laravel installation
====================

With laravel tool (thas preinstalled in images):

`docker exec dockervtechci_phpfpm_1 composer create-project laravel/laravel /var/www/test  "5.2.*"`

Or if you have an existing project in repo, simply `git clone test.git`

And then update `vhost_laravel.conf` line `root /var/www/html/www/public;` to `root /var/www/html/test/public;` 

Restart: `docker-compose rm && docker-compose up`

Update project dependencies with composer: 


Symfony installation
====================

curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony


Useful commands
----------------

    OSX: If Docker stops responding to network:
    
    VBoxManage modifyvm "default" --natdnshostresolver1 on
    
    docker-machine restart default 
    docker-machine regenerate-certs default
    eval $(docker-machine env default)
    
    Ok, worst case: 
    
    killall -9 VBoxHeadless && docker-machine restart default
    
    Reboot OS, if wont help.

Cleanup after this repo compose containers:

`docker rm $(docker ps -a | grep dockercomposephp_ | awk '{print $1;}')`

Cleanup all non running containers:

`docker rm $(docker ps -a | grep Created | awk '{print $1;}')`

    
Force recreate compose containers:

`docker-compose up --force-recreate`

Good links:
===========

https://docs.docker.com/v1.5/compose/cli/

CLI PHP7: https://hub.docker.com/r/rocketgraph/docker-nginx-php/~/dockerfile/

ES plugins in Docker: https://gist.github.com/benjamin-smith/78d330e08994fb5ce0de

http://blog.jez.io/2015/07/12/docker-tips-and-cheatsheet/

http://www.codedependant.net/2015/01/17/install-elastic-search-plugins-through-docker/

https://sandro-keil.de/blog/2015/10/05/docker-php-xdebug-cli-debugging/

https://github.com/devigner/docker-compose-php
