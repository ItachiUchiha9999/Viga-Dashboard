<?php
require_once("C:/laragon/www/Proyectos/Viga/php/connection.php");
$conexion = Conexion::Conectar();
if (!$conexion) {
    die("No se pudo restablecer la conexion con la base de datos");
}

$sql = "SELECT *
        FROM promotions
        WHERE fecha_fin >= CURDATE()";
$result = $conexion->query($sql);

$promotions = array();
while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    $promotions[] = $row;
}

echo json_encode(($promotions));
