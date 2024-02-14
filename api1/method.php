<?php
require "config/Conexion.php";
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE");
header("Access-Control-Allow-Headers: Content-Type");
//print_r($_SERVER['REQUEST_METHOD']);
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        // Consulta SQL para seleccionar datos de la tabla
        $sql = "SELECT p.`id`, 
        p.`nombre_producto`, 
        p.`descripcion_producto`, 
        p.`precio_producto`, 
        p.`imagen_producto`, 
        c.`categoria` AS `nombre_categoria`
        FROM 
        `productos` p
        JOIN 
        `categorias` c ON p.`id_categorias` = c.`id`;";

        $query = $conexion->query($sql);

        if ($query->num_rows > 0) {
            $data = array();
            while ($row = $query->fetch_assoc()) {
                $data[] = $row;
            }
            // Devolver los resultados en formato JSON
            header('Content-Type: application/json');
            echo json_encode($data);
        } else {
            echo "No se encontraron registros en la tabla.";
        }

        $conexion->close();
        break;

    case 'POST':
         
        $data = json_decode(file_get_contents("php://input"), true);

        $nombre_prod = $data['nombre_producto'];
        $descripcion_prod = $data['descripcion_producto'];
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

        if (!isset($data['id'])) {
            echo "Falta el ID del producto.";
            break;
        }

        $id = $data['id'];
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
        $sql = "UPDATE productos SET $actualizaciones_str WHERE id = $id";

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
            // Obtener datos del cuerpo de la solicitud
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);

            // Verificar si se recibieron datos válidos
            if ($data && isset($data['id'])) {
                // Obtener valores
                $id_prod = $data['id'];
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
                $sql = "UPDATE productos SET $actualizaciones_str WHERE id = $id_prod";

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
        
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);

            $id_prod = isset($_GET['id']) ? $_GET['id'] : (isset($data['id']) ? $data['id'] : null);
            if ($id_prod !== null) {
                $sql = "DELETE FROM productos WHERE id = $id_prod";

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

    default:
        echo 'Tipo de solicitud no definido!';
}

