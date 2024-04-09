<?php
require "config/Conexion.php";
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

//print_r($_SERVER['REQUEST_METHOD']);
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        header('Content-Type: application/json');
        // Consulta SQL para seleccionar datos de la tabla
        $sql = "SELECT 
                u.`id_usuario`, 
                u.`usuario`, 
                u.`correo`, 
                u.`contrasena`, 
                r.`rol` 
                FROM `usuarios` u 
                JOIN `roles` r 
                ON u.`id_rol` = r.`id`;";

        $query = $conexion->query($sql);

        if ($query->num_rows > 0) {
            $data = array();
            while ($row = $query->fetch_assoc()) {
                $data[] = $row;
            }
            // Devolver los resultados en formato JSON

            echo json_encode($data);
        } else {
            echo "No se encontraron registros en la tabla.";
        }

        $conexion->close();
        break;

        case 'POST':
            header('Content-Type: application/json');
            $data = json_decode(file_get_contents("php://input"), true);
    
            // Verificar acción: Crear usuario o verificar credenciales
            if (isset($data['action']) && $data['action'] === 'verifyCredentials') {
                $correo_usuario = $data['correo'];
                $contrasena_usuario = $data['contrasena'];
                
                $stmt = $conexion->prepare("SELECT id_usuario, usuario, correo, contrasena, id_rol FROM usuarios WHERE correo = ?");
                $stmt->bind_param("s", $correo_usuario);
                $stmt->execute();
                $stmt->store_result();
                
                if ($stmt->num_rows > 0) {
                    $stmt->bind_result($id_usuario, $nombre_usuario, $correo, $hashed_password, $id_rol);
                    $stmt->fetch();
                    
                    if (password_verify($contrasena_usuario, $hashed_password)) {
                        echo json_encode([
                            "message" => "Credenciales verificadas con éxito.",
                            "user" => [
                                "id_usuario" => $id_usuario,
                                "usuario" => $nombre_usuario,
                                "correo" => $correo,
                                "id_rol" => $id_rol
                            ]
                        ]);
                    } else {
                        http_response_code(401);
                        echo json_encode(["error" => "Credenciales inválidas."]);
                    }
                } else {
                    http_response_code(404);
                    echo json_encode(["error" => "Usuario no encontrado."]);
                }
                $stmt->close();
            } else {
                // Lógica para crear un usuario
                $nombre_usuario = $data['usuario'];
                $correo_usuario = $data['correo'];
                $contrasena_usuario = password_hash($data['contrasena'], PASSWORD_DEFAULT);
                $id_rol_usuario = 1;
    
                $stmt = $conexion->prepare("INSERT INTO usuarios (usuario, correo, contrasena, id_rol) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("sssi", $nombre_usuario, $correo_usuario, $contrasena_usuario, $id_rol_usuario);
    
                if ($stmt->execute()) {
                    echo json_encode(["message" => "Datos insertados con éxito."]);
                } else {
                    echo json_encode(["error" => "Error al insertar datos: " . $stmt->error]);
                }
                $stmt->close();
            }
            break;




    case 'PATCH':

        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data['id_usuario'])) {
            echo "Falta el ID del producto.";
            break;
        }
        header('Content-Type: application/json');
        $id_user = $data['id_usuario'];
        $nombre_usuario = isset($data['usuario']) ? $data['usuario'] : null;
        $correo_usuario = isset($data['correo']) ? $data['correo'] : null;
        $contrasena_usuario = isset($data['contrasena']) ? password_hash($data['contrasena'], PASSWORD_DEFAULT) : null;
        $rol_usuario = isset($data['id_rol']) ? $data['id_rol'] : null;

        $actualizaciones = array();
        if (!empty($nombre_usuario)) {
            $actualizaciones[] = "usuario = '$nombre_usuario'";
        }
        if (!empty($correo_usuario)) {
            $actualizaciones[] = "correo = '$correo_usuario'";
        }
        if (!empty($contrasena_usuario)) {
            $actualizaciones[] = "contrasena = '$contrasena_usuario'";
        }
        if (!empty($rol_usuario)) {
            $actualizaciones[] = "id_rol = '$rol_usuario'";
        }

        $actualizaciones_str = implode(', ', $actualizaciones);
        $sql = "UPDATE usuarios SET $actualizaciones_str WHERE id_usuario = $id_user";

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
            if ($data && isset($data['id_usuario'])) {
                // Obtener valores
                $id_user = $data['id_usuario'];
                $nombre_usuario = isset($data['usuario']) ? $data['usuario'] : null;
                $correo_usuario = isset($data['correo']) ? $data['correo'] : null;
                $contrasena_usuario = isset($data['contrasena']) ? password_hash($data['contrasena'], PASSWORD_DEFAULT) : null;
                $rol_usuario = isset($data['id_rol']) ? $data['id_rol'] : null; // Asegúrate de manejar el campo id_categorias

                // Preparar actualizaciones
                $actualizaciones = array();
                if (!empty($nombre_usuario)) {
                    $actualizaciones[] = "usuario = '$nombre_usuario'";
                }
                if (!empty($correo_usuario)) {
                    $actualizaciones[] = "correo = '$correo_usuario'";
                }
                if (!empty($contrasena_usuario)) {
                    $actualizaciones[] = "contrasena = '$contrasena_usuario'";
                }
                if (!empty($rol_usuario)) {
                    $actualizaciones[] = "id_rol = '$rol_usuario'";
                }


                $actualizaciones_str = implode(', ', $actualizaciones);
                $sql = "UPDATE usuarios SET $actualizaciones_str WHERE id_usuario = $id_user";

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

            $id_user = isset($_GET['id_usuario']) ? $_GET['id_usuario'] : (isset($data['id_usuario']) ? $data['id_usuario'] : null);
            if ($id_user !== null) {
                $sql = "DELETE FROM usuarios WHERE id_usuario = $id_user";

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
