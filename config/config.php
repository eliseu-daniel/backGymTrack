<?php

require_once __DIR__ . '/../vendor/autoload.php';

$dotenv =  Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

define('DB_HOST', $_ENV['DB_HOST']);
define('DB_NAME',$_ENV['DB_NAME']);
define('DB_USER', $_ENV['DB_USER']);
define('DB_PASS',$_ENV['DB_PASS']);

define('BASE_URL',$_ENV['BASE_URL']);


function connection(){
    try {    
    $conn = 'mysql:host=' . DB_HOST . '; dbname=' . DB_NAME;

    $pdo = new PDO($conn, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::FETCH_ASSOC);

    return $pdo;
    } catch (PDOException $e) {
        echo 'Erro ao conectar' . $e->getMessage();
        exit;
    }
}