<?php
define('con', mysqli_connect('localhost', 'consultor', '_C0NSXLT0R_'));
if (!con) {
    die('Could not connect: ' . mysqli_error(con));
} else {
    // Seleccionamos la base de datos
    mysqli_select_db(con, "prueba_tec");
}

// Revisamos si es que se ha enviado una petición GET
if ($_GET) {
    $tipo = $_GET['tipo'];
    if ($tipo == 'region') {
        // Seleccionaremos los datos de la tabla región y los almacenaremos en un Array (rows)
        // Luego codificaremos el array en formato JSON y lo retornaremos al cliente.
        $sql = "SELECT * FROM region";
        $rows = [];
        $result = mysqli_query(con, $sql);
        while ($row = mysqli_fetch_array($result)) {
            $rows[] = $row;
        }
        echo json_encode($rows);
    } else if ($tipo == 'comuna') {
        $region = $_GET['region'];
        $sql = "SELECT * FROM comuna WHERE id_region = $region";
        $rows = [];
        $result = mysqli_query(con, $sql);
        while ($row = mysqli_fetch_array($result)) {
            $rows[] = $row;
        }
        echo json_encode($rows);
    } else if ($tipo == 'candidato') {
        $sql = "SELECT * FROM candidato";
        $rows = [];
        $result = mysqli_query(con, $sql);
        while ($row = mysqli_fetch_array($result)) {
            $rows[] = $row;
        }
        echo json_encode($rows);
    } else if ($tipo == 'voto') {
        getVoto($_GET['rut']);
    }
}

// Revisamos si es que se ha enviado una petición POST
if ($_POST) {
    $nombre = $_POST['nombre_completo'];
    $alias = $_POST['alias'];
    $rut = $_POST['rut'];
    $email = $_POST['email'];
    $region = $_POST['region'];
    $comuna = $_POST['comuna'];
    $candidato = $_POST['candidato'];
    $como_entero = $_POST['como_se_entero'];

    $sql = "INSERT INTO voto  (nombre, alias, rut, email, region, comuna, candidato, como_entero)
        VALUES
        ('$nombre', '$alias', '$rut', '$email', '$region', '$comuna', '$candidato', '$como_entero')";
    $result = mysqli_query(con, $sql);
    //con -> exec($sql);
    //echo "{ 'success': 'Voto registrado' }";
    if ($result) {
        echo json_encode("{ 'success': 'Voto registrado' }");
        header('Location: http://localhost/pruebatecnica/index.php?voto=true');
    } else {
        echo json_encode("{ 'error': ".mysqli_error(con)." }");
    }

    //echo $nombre . " | " . $alias . " | " . $rut . " | " . $email . " | " . $region . " | " . $comuna . " | " . $candidato . " | " . $como_entero;
}

function getVoto($rut) {
    $sql = "SELECT * FROM voto WHERE rut = $rut";
    $result = con->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row
        $rows = [];
        $result = mysqli_query(con, $sql);
        while ($row = mysqli_fetch_array($result)) {
            $rows[] = $row;
        }
        echo json_encode($rows);
      } else {
        echo json_encode([]);
      }
}
?>