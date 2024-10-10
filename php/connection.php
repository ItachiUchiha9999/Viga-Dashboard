<?php
class Conexion {
    public static function Conectar() {
        define('servidor', 'localhost');
        define('nombre_bd', 'ecommerce_dashboard');
        define('usuario', 'root');
        define("password", 'Enmali99');

        $option = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");

        try {
            return new PDO("mysql:host=" . servidor . "; dbname=" . nombre_bd, usuario, password, $option);
        } catch (Exception $e) {
            die("Error de conexión es: " . $e->getMessage());
        }
    }
}
?>
