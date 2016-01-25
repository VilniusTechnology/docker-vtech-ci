<?php

$host = 'db';
$user = 'root';
$pass = 'root';
$db = 'mysql';

$mysqli = new mysqli($host, $user, $pass, $db);

$db = new PDO('mysql:host=' . $host . ';dbname=' . $db . ';charset=utf8', $user, $pass);
