Quick start
-----------

1. Git clone `git clone git@github.com:VilniusTechnology/docker-vtech-ci.git`.

1.1. Mo to projects dir: `cd docker-vtech-ci`.

2.1. Run `docker-compose`

2.2. Check php.ini settings `http://192.168.99.100`. Also `http://192.168.99.100/mysql.php` checks mysql connection.


2.3. If PHP5 is not good, choose uncomment desirable PHP version lines.

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

Rebuild images and containers.

If you need to switch versions constantly tag them.

Making changes in component containers
--------------------------------------

If have made any change in Dockerfile, you should:

1. Clean all non running compose containers:

`docker-compose rm $(docker-compose ps | grep Exit | awk '{print $1;}')`

2. Clean all images from this repo:

`docker rmi -f $(docker images | grep dockervtechci_ | awk '{print $3;}') && docker-compose rm -y`

`docker rmi -f $(docker images | grep vtech_php | awk '{print $3;}') && docker-compose rm -y`

3. Run compose again:

`docker-compose up`

4. For fast PHP version switching: You can tag your PHP versions image, so you wont have to rebuild it next time. 
After tagging You should update your *.yml file to use newly tagged images not build using extended *.yml.

`docker tag <image id> mynewtag:version`

Containers must be rebuilded now.

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
