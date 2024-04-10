<?php
require "config/Conexion.php";
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');
//print_r($_SERVER['REQUEST_METHOD']);
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        $searchTerm = isset($_GET['q']) ? $_GET['q'] : '';
    
        $sql = "SELECT p.`id_producto`, 
                p.`nombre_producto`, 
                p.`descripcion_producto`, 
                p.`precio_producto`, 
                p.`imagen_producto`, 
                c.`categoria` AS `nombre_categoria`
                FROM `productos` p
                JOIN `categorias` c ON p.`id_categorias` = c.`id`";
    
        if (!empty($searchTerm)) {
            $sql .= " WHERE p.`nombre_producto` LIKE '%$searchTerm%'";
        }
    
        $query = $conexion->query($sql);
    
        if ($query->num_rows > 0) {
            $data = array();
            while ($row = $query->fetch_assoc()) {
                $data[] = $row;
            }
            echo json_encode($data);
        } else {
            echo "No se encontraron registros en la tabla.";
        }
    
        $conexion->close();
        break;

    case 'POST':
        header('Content-Type: application/json');
        $data = json_decode(file_get_contents("php://input"), true);

        $nombre_prod = $data['nombre_producto'];
        $descripcion_prod = $data['descripcion_producto'];-
        $precio_prod = $data['precio_producto'];
        $img_prod = $data['imagen_producto'];
        $categoria_prod = $data['nombre_categoria'];

        $stmt = $conexion->prepare("INSERT INTO productos (nombre_producto, descripcion_producto, precio_producto, imagen_producto, id_categorias) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $nombre_prod, $descripcion_prod, $precio_prod, $img_prod, $categoria_prod);

        if ($stmt->execute()) {
            header('Content-Type: application/json');
            echo "Datos insertados con éxito.";
        } else {
            echo "Error al insertar datos: " . $stmt->error;
        }
        $stmt->close();
        break;



    case 'PATCH':
        
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data['id_producto'])) {
            echo "Falta el ID del producto.";
            break;
        }
        header('Content-Type: application/json');
        $id = $data['id_producto'];
        $nombre_prod = isset($data['nombre_producto']) ? $data['nombre_producto'] : null;
        $descripcion_prod = isset($data['descripcion_producto']) ? $data['descripcion_producto'] : null;
        $precio_prod = isset($data['precio_producto']) ? $data['precio_producto'] : null;
        $img_prod = isset($data['imagen_producto']) ? $data['imagen_producto'] : null;
        $categoria_prod = isset($data['nombre_categoria']) ? $data['nombre_categoria'] : null; // Asegúrate de manejar el campo id_categorias

        $actualizaciones = array();
        if (!empty($nombre_prod)) {
            $actualizaciones[] = "nombre_producto = '$nombre_prod'";
        }
        if (!empty($descripcion_prod)) {
            $actualizaciones[] = "descripcion_producto = '$descripcion_prod'";
        }
        if (!empty($precio_prod)) {
            $actualizaciones[] = "precio_producto = '$precio_prod'";
        }
        if (!empty($img_prod)) {
            $actualizaciones[] = "imagen_producto = '$img_prod'";
        }
        if (!empty($categoria_prod)) {
            $actualizaciones[] = "id_categorias = '$categoria_prod'";
        }

        $actualizaciones_str = implode(', ', $actualizaciones);
        $sql = "UPDATE productos SET $actualizaciones_str WHERE id_producto = $id";

        if ($conexion->query($sql) === TRUE) {
            echo "Registro actualizado con éxito.";
        } else {
            echo "Error al actualizar registro: " . $conexion->error;
        }

        $conexion->close();
        break;


    case 'PUT':
       
        // Verificar si es una solicitud PUT
        if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
            header('Content-Type: application/json');
            // Obtener datos del cuerpo de la solicitud
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);

            // Verificar si se recibieron datos válidos
            if ($data && isset($data['id_producto'])) {
                // Obtener valores
                $id_prod = $data['id_producto'];
                $nombre_prod = isset($data['nombre_producto']) ? $data['nombre_producto'] : null;
                $descripcion_prod = isset($data['descripcion_producto']) ? $data['descripcion_producto'] : null;
                $precio_prod = isset($data['precio_producto']) ? $data['precio_producto'] : null;
                $img_prod = isset($data['imagen_producto']) ? $data['imagen_producto'] : null;
                $categoria_prod = isset($data['nombre_categoria']) ? $data['nombre_categoria'] : null; // Asegúrate de manejar el campo id_categorias

                // Preparar actualizaciones
                $actualizaciones = array();
                if (!empty($nombre_prod)) {
                    $actualizaciones[] = "nombre_producto = '$nombre_prod'";
                }
                if (!empty($descripcion_prod)) {
                    $actualizaciones[] = "descripcion_producto = '$descripcion_prod'";
                }
                if (!empty($precio_prod)) {
                    $actualizaciones[] = "precio_producto = '$precio_prod'";
                }
                if (!empty($img_prod)) {
                    $actualizaciones[] = "imagen_producto = '$img_prod'";
                }
                if (!empty($categoria_prod)) { // Agrega la actualización para id_categorias si está presente
                    $actualizaciones[] = "id_categorias = '$categoria_prod'";
                }

                $actualizaciones_str = implode(', ', $actualizaciones);
                $sql = "UPDATE productos SET $actualizaciones_str WHERE id_producto = $id_prod";

                // Ejecutar consulta SQL
                if ($conexion->query($sql) === TRUE) {
                    echo "Registro actualizado con éxito.";
                } else {
                    echo "Error al actualizar registro: " . $conexion->error;
                }
            } else {
                echo "Datos inválidos o incompletos en la solicitud JSON.";
            }
        } else {
            echo "Método de solicitud no válido.";
        }
        $conexion->close();
        break;



    case 'DELETE':
        
        // Verificar si es una solicitud DELETE
        if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
         header('Content-Type: application/json');
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);

            $id_prod = isset($_GET['id_producto']) ? $_GET['id_producto'] : (isset($data['id_producto']) ? $data['id_producto'] : null);
            if ($id_prod !== null) {
                $sql = "DELETE FROM productos WHERE id_producto = $id_prod";

                if ($conexion->query($sql) === TRUE) {
                    echo "Registro eliminado con éxito.";
                } else {
                    echo "Error al eliminar registro: " . $conexion->error;
                }
            } else {
                echo "Falta el ID del producto.";
            }
        } else {
            echo "Método de solicitud no válido.";
        }
        $conexion->close();
        break;

        case 'HEAD':
            if ($_SERVER['REQUEST_METHOD'] === 'HEAD') {
              // Establecer encabezados de respuesta
              header('Content-Type: application/json');
              header('Custom-Header: PHP 8, HTML ');
          
              // Puedes establecer otros encabezados necesarios aquí
          
              // No es necesario enviar un cuerpo en una solicitud HEAD, por lo que no se imprime nada aquí.
          } else {
              http_response_code(405); // Método no permitido
              echo 'Método de solicitud no válido';
          }
            break;

    default:
        echo 'Tipo de solicitud no definido!';
}

