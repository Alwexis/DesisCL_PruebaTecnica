<?php
    if ($_GET) {
        $voto = $_GET['voto'];
        if ($voto == 'true') {
            echo "<script>alert('Voto registrado correctamente!');</script>";
        }
    }
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba Técnica</title>
    <link rel="stylesheet" href="index.css">
</head>

<body>
    <h1>FORMULARIO DE VOTACIÓN:</h1>

    <form onsubmit="return validarFormulario(event)" action="db.php" method="POST">
        <section class="input-wrapper">
            <div class="form-input">
                <label for="nombre">Nombre y Apellido</label>
                <input required placeholder="Ariel Silva" type="text" name="nombre_completo" id="nombre_apellido">
            </div>
            <div class="form-input">
                <label for="alias">Alias</label>
                <input required placeholder="Ariel" type="text" name="alias" id="alias">
            </div>
            <div class="form-input">
                <label for="rut">Rut</label>
                <input required placeholder="12345678-9" type="text" name="rut" id="rut">
            </div>
            <div class="form-input">
                <label for="email">Email</label>
                <input required placeholder="ejemplo@gmail.com" type="email" name="email" id="email">
            </div>
            <div class="form-input">
                <label for="region">Región</label>
                <select required onchange="getComunas()" name="region" id="region_select">
                </select>
            </div>
            <div class="form-input">
                <label for="comuna">Comuna</label>
                <select required name="comuna" id="comuna_select">
                </select>
            </div>
            <div class="form-input">
                <label for="candidato">Candidato</label>
                <select required name="candidato" id="candidato_select">
                </select>
            </div>
            <div class="form-input">
                <label for="como-entero">Como se enteró de Nosotros</label>
                <input style="display: none;" name="como_se_entero" id="como_se_entero" type="text">
                <section class="check-box-wrapper">
                    <div class="check-box-container">
                        <label for="web">Web</label>
                        <input type="checkbox" name="web" value="web">
                    </div>
                    <div class="check-box-container">
                        <label for="tv">TV</label>
                        <input type="checkbox" name="tv" value="tv">
                    </div>
                    <div class="check-box-container">
                        <label for="redes">Redes Sociales</label>
                        <input type="checkbox" name="redes" value="redes">
                    </div>
                    <div class="check-box-container">
                        <label for="amigo">Amigo</label>
                        <input type="checkbox" name="amigo" value="amigo">
                    </div>
                </section>
            </div>
            <div class="error-messages">
                <span class="error-title">(!) Hay errores en su Formulario:</span>
                <div class="errors">

                </div>
            </div>
        </section>
        <input type="submit" value="Votar">
    </form>

    <script src="index.js"></script>
</body>

</html>