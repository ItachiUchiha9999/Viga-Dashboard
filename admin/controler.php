<?php
require_once('../php/connection.php');

$conexion = Conexion::Conectar();

if (!empty($_POST["btningresar"])) {
    if (empty($_POST["usuario"]) && empty($_POST["password"])) {
        echo "Completar los campos vacios";
    } else {
        $usuario = $_POST["usuario"];
        $password = $_POST["password"];

        $sql = $conexion->prepare("SELECT * FROM admins WHERE username = :username AND pass = :password");
        $sql->bindParam(':username', $usuario);
        $sql->bindParam(':password', $password);
        $sql->execute();

        if ($data = $sql->fetchObject()) {
            header("Location: ../admin/Dashboard/examples\dashboard.php");
        } else {
            echo "Acceso Denegado";
        }
    }
}
?>
