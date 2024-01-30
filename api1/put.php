<!DOCTYPE html>
<html>
<head>
    <title>Actualizar Registro</title>
</head>
<body>
    <h1>Actualizar Registro</h1>
    
    <form id="updateForm">
        <label for="id">ID del Registro a Actualizar:</label>
        <input type="text" id="id" name="id" required><br>

        <label for="producto">Nuevo producto:</label>
        <input type="text" id="nombre_producto" name="producto"><br>

        <label for="descripcion">Nueva descripcion:</label>
        <input type="text" id="descripcion_producto" name="descripcion"><br>

        <label for="precio">Nuevo precio:</label>
        <input type="text" id="precio_producto" name="precio"><br>

        <label for="img">Nueva imagen:</label>
        <input type="text" id="imagen_producto" name="precio"><br>

        <button type="button" id="putButton">Actualizar con PUT</button>
        <button type="button" id="patchButton">Actualizar con PATCH</button>
    </form>

    <div id="response"></div>

    <script>
        document.getElementById('putButton').addEventListener('click', function () {
            actualizarRegistro('PUT');
        });

        document.getElementById('patchButton').addEventListener('click', function () {
            actualizarRegistro('PATCH');
        });

        function actualizarRegistro(metodo) {
            var id = document.getElementById('id').value;
            var nombre_producto = document.getElementById('nombre_producto').value;
            var descripcion_producto = document.getElementById('descripcion_producto').value;
            var precio_producto = document.getElementById('precio_producto').value;
            var imagen_producto = document.getElementById('imagen_producto').value;

            var data = new URLSearchParams();
            data.append('id', id);
            data.append('nombre_producto', nombre_producto);
            data.append('descripcion_producto', descripcion_producto);
            data.append('precio_producto', precio_producto);
            data.append('imagen_producto', imagen_producto);

            fetch('method.php', {
                method: metodo,
                body: data
            })
            .then(function(response) {
                return response.text();
            })
            .then(function(data) {
                document.getElementById('response').textContent = data;
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
        }
    </script>
</body>
</html>
