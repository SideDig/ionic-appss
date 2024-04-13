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
        // Separar la URL por "/" y tomar el primer segmento
        $urlParts = explode('/', $url);
        $route = '/' . $urlParts[1]; // Tomar el primer segmento como ruta

        if (isset($this->routes[$route])) {
            require $this->routes[$route];
        } else {
            http_response_code(404); // Establece el código de respuesta HTTP adecuado
            echo "404 Not Found";
        }
    }
}

$router = new Router();
// Tus rutas existentes
$router->addRoute('/usuarios', './routes/usuarios.php');
$router->addRoute('/productos', './routes/productos.php');
$router->addRoute('/banners', './routes/banners.php');
$router->addRoute('/categorias', './routes/categorias.php');
$router->addRoute('/auth', './routes/auth.php');

// Modificar la línea que procesa la URL para eliminar cualquier parámetro de consulta
$url = strtok(str_replace('/api1', '', $_SERVER['REQUEST_URI']), '?');
$router->route($url);
