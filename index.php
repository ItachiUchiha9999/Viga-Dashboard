<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <title>Viga</title>
</head>
<body>
    <?php
    include_once('./php/config.php');
    include_once('./components/header.php');
    ?>
    <main>
        <section>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numertext">1 / 3</div>
                    <img src="./assets/img/slider1.jpg" alt="">
                    <div class="text"></div>
                </div>
                <div class="mySlides fade">
                    <div class="numertext">2 / 3</div>
                    <img src="./assets/img/slider2.jpg" alt="">
                    <div class="text"></div>
                </div>
                <div class="mySlides fade">
                    <div class="numertext">3 / 3</div>
                    <img src="./assets/img/slider3.jpg" alt="">
                    <div class="text"></div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="column-1">
                    <a href=""><img src="./assets/img/faja.jpg" alt="" class="zoom-img"></a>
                </div>
                <div class="column-2">
                    <div class="top-row">
                        <a href=""><img src="./assets/img/slouchy.jpg" alt="" class="zoom-img"></a>
                    </div>
                    <div class="bottom-row">
                        <div class="bottom-column">
                            <a href=""><img src="./assets/img/bajo.jpg" alt="" class="zoom-img"></a>
                        </div>
                        <div class="bottom-column">
                            <a href=""><img src="./assets/img/alto.jpg" alt="" class="zoom-img"></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container-element">
                <div class="element">
                    <i class='bx bx-badge-check'></i>
                    <h2>20% OFF EN TODA LA WEB</h2>
                </div>
                <div class="element">
                    <i class='bx bxs-truck'></i>
                    <h2>ENVIOS A TODO EL PAIS</h2>
                    <h3>Por Correo Argentino</h3>
                </div>
                <div class="element">
                    <i class='bx bxl-whatsapp' ></i>
                    <h2>ASESORAMIENTO PERSONALIZADO</h2>
                    <h3>Escribrinos y te asesoramos</h3>
                </div>
            </div>
        </section>
        <section>
            <div class="Ofert">
                <h1>Recibi todas las ofertas</h1>

                <h3>Quieres recibir nuestras ofertas? Registrate ya 
                    mismo y comenza a disfrutarlas!
                </h3>
                <input type="text" class="mail" placeholder="Email">
            </div>
            <div class="btn">
                <button class="send">ENVIAR</button>
            </div>
        </section>
    </main>
    <?php
    include('./components/footer.php');
    ?>

    <!--Script Main-->
    
    <script src="./assets/js/script.js"></script>


    <!--jQuery - Bootstrap - Poppers-->
    
    <script src="./assets/jQuery/jquery-3.3.1.min.js"></script>
    <script src="./assets/Popper/popper.min.js"></script>
    <script src="./assets/bootstrap/js/bootstrap.min.js"></script>

    <!--Datatable-->

    <script src="./assets/datatables/datatables.min.js"></script>

</body>
</html>