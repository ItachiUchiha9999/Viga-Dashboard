<?php
require_once("C:/laragon/www/Proyectos/Viga/php/connection.php");
$conexion = Conexion::Conectar();
if (!$conexion) {
    die("No se pudo restablecer la conexion con la base de datos");
}

if (isset($_GET["id"])) {
    $id = $_GET["id"];

    $sql = "DELETE FROM customers
            WHERE id_customers = $id";
            $conexion->query($sql);
}

header("Location: ../examples/customers.php");
exit;

?>