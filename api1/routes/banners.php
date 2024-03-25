<?php
require "config/Conexion.php";
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');
//print_r($_SERVER['REQUEST_METHOD']);
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        header('Content-Type: application/json');
        // Consulta SQL para seleccionar datos de la tabla
        $sql = "SELECT id_banner, nombre_banner, link_banner, imagen_banner from banners";

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

        $nombre_banner= $data['nombre_banner'];
        $link_banner = $data['link_banner'];
        $img_banner = $data['imagen_banner'];

        $stmt = $conexion->prepare("INSERT INTO banners (nombre_banner, link_banner, imagen_banner) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $nombre_banner, $link_banner, $img_banner);

        if ($stmt->execute()) {
            header('Content-Type: application/json');
            echo "Datos insertados con éxito.";
        } else {
            echo "Error al insertar datos: " . $stmt->error;
        }
        $stmt->close();
        break;


        case 'DELETE':
            // Verificar si es una solicitud DELETE
            if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
             header('Content-Type: application/json');
                $json_data = file_get_contents("php://input");
                $data = json_decode($json_data, true);
    
                $id_banners = isset($_GET['id_banner']) ? $_GET['id_banner'] : (isset($data['id_banner']) ? $data['id_banner'] : null);
                if ($id_banners !== null) {
                    $sql = "DELETE FROM banners WHERE id_banner  = $id_banners";
    
                    if ($conexion->query($sql) === TRUE) {
                        echo "Registro eliminado con éxito.";
                    } else {
                        echo "Error al eliminar registro: " . $conexion->error;
                    }
                } else {
                    echo "Falta el ID del banner.";
                }
            } else {
                echo "Método de solicitud no válido.";
            }
            $conexion->close();
            break;
}