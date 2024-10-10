<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../admin/style-login.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
    <title>Login</title>
</head>

<body>
    <div class="container">
        <div class="login-content">
            <h2 class="title">Form Login</h2>
            <?php
            include("../php/connection.php");
            include("./controler.php");
            ?>
            <form method="POST" action="">
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="div">
                        <h5>Usuario</h5>
                        <input id="usuario" type="text" class="input" name="usuario" required>
                    </div>
                </div>
                <div class="input-div pass">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Contraseña</h5>
                        <input type="password" id="input" class="input" name="password" required>
                    </div>
                </div>
                <div class="text-center">
                    <a class="font-italic isai5" href="">Olvidé mi contraseña</a>
                    <a class="font-italic isai5" href="">Registrarse</a>
                </div>
                <input name="btningresar" class="btn" type="submit" value="LOGIN">
            </form>
        </div>
    </div>

    <script src="../assets/js/script.js"></script>
    <script src="https://kit.fontawesome.com/0b2defb275.js" crossorigin="anonymous"></script>
</body>

</html>