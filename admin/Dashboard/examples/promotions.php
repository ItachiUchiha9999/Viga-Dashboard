<?php
require_once("C:/laragon/www/Proyectos/Viga/php/connection.php");
$conexion = Conexion::Conectar();
if (!$conexion) {
    die("No se pudo restablecer la conexion con la base de datos");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_promotion'])) {
    $name = $_POST['name'];
    $descr = $_POST['descr'];
    $tipo = $_POST['tipo'];
    $valor = $_POST['valor'];
    $fecha_ini = $_POST['fecha_ini'];
    $fecha_fin = $_POST['fecha_fin'];

    if (!is_numeric($valor) || $valor < -99999999.99 || $valor > 99999999.99) {
        die("Error: El valor debe ser numérico y estar entre -99999999.99 y 99999999.99.");
    }

    $valor = number_format($valor, 2, '.', '');

    $sql = "INSERT INTO promotions (name, descr, tipo, valor, fecha_ini, fecha_fin)
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conexion->prepare($sql);
    $stmt->bindValue(1, $name, PDO::PARAM_STR);
    $stmt->bindValue(2, $descr, PDO::PARAM_STR);
    $stmt->bindValue(3, $tipo, PDO::PARAM_STR);
    $stmt->bindValue(4, $valor, PDO::PARAM_STR);
    $stmt->bindValue(5, $fecha_ini, PDO::PARAM_STR);
    $stmt->bindValue(6, $fecha_fin, PDO::PARAM_STR);

    if ($stmt->execute()) {
        echo "Promotion assigned successfully";
    } else {
        echo "Error: " . $stmt->errorInfo()[2];
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Panel Admin - Promotions</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0" rel="stylesheet" />
    <link href="../assets/css/demo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar" data-image="../assets/img/sidebar-5.jpg">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text">Customers</a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="../examples/dashboard.php">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Home</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../examples/user.html">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Profile</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../examples/customers.php">
                            <i class="nc-icon nc-single-02"></i>
                            <p>Customers</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../examples/products.php">
                            <i class="nc-icon nc-app"></i>
                            <p>Products</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../examples/report.php">
                            <i class="nc-icon nc-delivery-fast"></i>
                            <p>Reports</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../examples/promotions.php">
                            <i class="nc-icon nc-tag-content"></i>
                            <p>Promotions</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../examples/notifications.html">
                            <i class="nc-icon nc-settings-gear-64"></i>
                            <p>Configuration</p>
                        </a>
                    </li>
                    <li class="nav-item active active-pro">
                        <a class="nav-link active" href="../examples/upgrade.html">
                            <i class="nc-icon nc-alien-33"></i>
                            <p>Upgrade to PRO</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo"> Promotions </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-palette"></i>
                                    <span class="d-lg-none">Dashboard</span>
                                </a>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-planet"></i>
                                    <span class="notification">5</span>
                                    <span class="d-lg-none">Notification</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Notification 2</a>
                                    <a class="dropdown-item" href="#">Notification 3</a>
                                    <a class="dropdown-item" href="#">Notification 4</a>
                                    <a class="dropdown-item" href="#">Another notification</a>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Search</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Dropdown</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"> Promotions</h4>
                                    <p class="card-category"> Add a new promotion</p>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="promotions.php">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" name="name" class="form-control" placeholder="Name of the promotion" required>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <input type="text" name="descr" class="form-control" placeholder="Description" required>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label>Type</label>
                                                    <select name="tipo" class="form-control" required>
                                                        <option value="percentage">Porcentaje</option>
                                                        <option value="Puntos">Puntos</option>
                                                        <option value="Descuento">Descuento</option>
                                                        <option value="2x1">2x1</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Value</label>
                                                    <input type="number" name="valor" step="0.01" class="form-control" placeholder="Value" required>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Start Date</label>
                                                    <input type="date" name="fecha_ini" class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>End Date</label>
                                                    <input type="date" name="fecha_fin" class="form-control" required>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" name="add_promotion" class="btn btn-info btn-fill pull-right">Add Promotion</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <button id="show-promotions" class="btn btn-primary btn-fill pull-right">Show Active Promotions</button>
                        </div>
                    </div>

                    <div id="active-promotions" class="row" style="display:none;">
                        <div class="col-md-12">
                            <h4>Active Promotions:</h4>
                            <table id="promotions-table" class="table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Type</th>
                                        <th>Value</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="float-left">
                        <ul>
                            <li>
                                <a href="http://www.creative-tim.com">
                                    Creative Tim
                                </a>
                            </li>
                            <li>
                                <a href="http://presentation.creative-tim.com">
                                    About Us
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="copyright float-right">
                        &copy; 2024, made with <i class="fa fa-heart heart"></i> by Creative Tim
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#promotions-table').DataTable();

            $('#show-promotions').click(function() {
                $.ajax({
                    url: 'list_promotions.php',
                    type: 'GET',
                    success: function(data) {
                        const promotions = JSON.parse(data);
                        const tbody = $('#promotions-table tbody');
                        tbody.empty(); // Clear the table body
                        promotions.forEach(promotion => {
                            tbody.append(`
                                <tr>
                                    <td>${promotion.name}</td>
                                    <td>${promotion.descr}</td>
                                    <td>${promotion.tipo}</td>
                                    <td>${promotion.valor}</td>
                                    <td>${promotion.fecha_ini}</td>
                                    <td>${promotion.fecha_fin}</td>
                                </tr>
                            `);
                        });
                        $('#active-promotions').show();
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching promotions:', error);
                    }
                });
            });
        });
    </script>
</body>

</html>