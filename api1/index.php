<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

class Router {
    private $routes = array();

    public function addRoute($route, $file) {
        $this->routes[$route] = $file;
    }

    public function route($url) {
        if (isset($this->routes[$url])) {
            require $this->routes[$url];
        } else {
            echo "404 Not Found";
        }
    }
}

$router = new Router();
$router->addRoute('/usuarios', './routes/usuarios.php');
$router->addRoute('/productos', './routes/productos.php');
$router->addRoute('/auth', './routes/auth.php');


$url = str_replace('/api1', '', $_SERVER['REQUEST_URI']);
$router->route($url);
?>