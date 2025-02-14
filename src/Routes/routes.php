<?php

require_once __DIR__ . '/../vendor/autoload.php';

use Src\Controller\UserController;

$request = $_SERVER['REQUEST_URI'];

switch ($request) {
    case 'api/':
    case 'api/login':
        $controller = new UserController;
        $controller->login();
        break;
    default:
        http_response_code(404);
        echo json_encode(['error' => 'Rota não encontrada']);
        break;
}

