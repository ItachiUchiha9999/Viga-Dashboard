<?php
require_once("C:/laragon/www/Proyectos/Viga/php/connection.php");
$conexion = Conexion::Conectar();
if (!$conexion) {
    die ("No se pudo establecer conexion con la base de datos");
}


?>