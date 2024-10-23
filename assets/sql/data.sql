CREATE DATABASE ecommerce_dashboard;

USE ecommerce_dashboard;

CREATE TABLE Users(
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    pass VARCHAR(250) NOT NULL
);

CREATE TABLE Admins(
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    pass VARCHAR(250) NOT NULL
);

CREATE TABLE Brand(
    id_brand INT AUTO_INCREMENT PRIMARY KEY,
    name_brand VARCHAR(250) NOT NULL,
    descrip VARCHAR(250) NOT NULL
);

CREATE TABLE Suppliers(
    id_supp INT AUTO_INCREMENT PRIMARY KEY,
    name_supp VARCHAR(250) NOT NULL,
    direction VARCHAR(250) NOT NULL,
    phone VARCHAR(13) NOT NULL,
    email VARCHAR(250) NOT NULL
);

CREATE TABLE Products(
    id_products INT AUTO_INCREMENT PRIMARY KEY,
    name_prod VARCHAR(250) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    brand_id INT,
    supp_id INT,
    FOREIGN KEY(brand_id) REFERENCES Brand(id_brand),
    FOREIGN KEY(supp_id) REFERENCES Suppliers(id_supp)
);

CREATE TABLE Customers(
    id_customers INT AUTO_INCREMENT PRIMARY KEY,
    name_custo VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    phone VARCHAR(13) NOT NULL,
    email VARCHAR(250) NOT NULL
);

CREATE TABLE Shop(
    id_shop INT AUTO_INCREMENT PRIMARY KEY,
    descr VARCHAR(250) NOT NULL,
    fecha DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    products_id INT,
    customers_id INT,
    user_id INT,
    brand_id INT,
    FOREIGN KEY(products_id) REFERENCES Products(id_products),
    FOREIGN KEY(customers_id) REFERENCES Customers(id_customers),
    FOREIGN KEY(user_id) REFERENCES Users(id_user),
    FOREIGN KEY(brand_id) REFERENCES Brand(id_brand)
);

CREATE TABLE Promotions(
    id_promo INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    descr TEXT,
    tipo ENUM('descuento', '2x1', 'envios_gratis'),
    valor DECIMAL(10,2),
    fecha_ini DATE,
    fecha_fin DATE
);

CREATE TABLE Product_promotions(
    id_prod_pro INT AUTO_INCREMENT PRIMARY KEY,
    products_id INT,
    promotions_id INT,
    FOREIGN KEY (products_id) REFERENCES Products(id_products),
    FOREIGN KEY (promotions_id) REFERENCES Promotions(id_promo)
);

DELIMITER //

CREATE PROCEDURE insert_user(IN p_username VARCHAR(250),
                             IN p_email VARCHAR(250),
                             IN p_pass VARCHAR(250))
BEGIN
    INSERT INTO Users(username,email,pass) VALUES (p_username,p_email,p_pass);
END //

CREATE PROCEDURE insert_admins(IN p_username VARCHAR(250),
                               IN p_email VARCHAR(250),
                               IN p_pass VARCHAR(250))
BEGIN
    INSERT INTO Admins(username,email,pass) VALUES (p_username,p_email,p_pass);
END //

CREATE PROCEDURE insert_brand(IN p_name_brand VARCHAR(250),
                              IN p_descrip VARCHAR(250))
BEGIN
    INSERT INTO Brand(name_brand,descrip) VALUES (p_name_brand,p_descrip);
END //

CREATE PROCEDURE insert_suppliers(IN p_name_supp VARCHAR(250),
                                  IN p_direction VARCHAR(250),
                                  IN p_phone VARCHAR(13),
                                  IN p_email VARCHAR(250))
BEGIN
    INSERT INTO Suppliers(name_supp,direction,phone,email) VALUES (p_name_supp,p_direction,p_phone,p_email);
END //

CREATE PROCEDURE insert_products(IN p_name_prod VARCHAR(250),
                                 IN p_price DECIMAL(10,2),
                                 IN p_brand_id INT,
                                 IN p_supp_id INT)
BEGIN
    INSERT INTO Products(name_prod,price,brand_id,supp_id) VALUES (p_name_prod,p_price,p_brand_id,p_supp_id);
END //

CREATE PROCEDURE insert_customers(IN p_name_custo VARCHAR(250),
                                  IN p_last_name VARCHAR(250),
                                  IN p_phone VARCHAR(13),
                                  IN p_email VARCHAR(250))
BEGIN
    INSERT INTO Customers(name_custo,last_name,phone,email) VALUES (p_name_custo,p_last_name,p_phone,p_email);
END //

CREATE PROCEDURE insert_shop(IN p_descr VARCHAR(250),
                             IN p_fecha DATETIME,
                             IN P_total DECIMAL(10,2),
                             IN p_products_id INT,
                             IN p_customers_id INT,
                             IN p_user_id INT,
                             IN p_brand_id INT)
BEGIN
    INSERT INTO Shop(descr,fecha,total,products_id,customers_id,user_id,brand_id) VALUES (p_descr,P_fecha,p_total,p_products_id,p_customers_id,p_user_id,p_brand_id);
END
DELIMITER ;

CALL insert_user('prueba1','prueba1@gmail.com','1234');
CALL insert_admins('enzo','liendroEnzo99@gmail.com','1234');
CALL insert_brand('viga','tiro baja');
CALL insert_suppliers('Viga Cordoba','Cordoba','+543516349683','paseoriveravigabootlegger@outlook.com');


CALL insert_products('ALTO MODA SLIM FIT(8859)', 54200.00, 1, 1);
CALL insert_products('ALTO MODA REGULAR FIT(8860)', 78900.00, 1, 1);
CALL insert_products('ALTO MODA BOOTCUT(8861)', 63750.00, 1, 1);
CALL insert_products('ALTO MODA STRAIGHT LEG(8862)', 92400.00, 1, 1);
CALL insert_products('ALTO MODA TAPERED(8863)', 110500.00, 1, 1);
CALL insert_products('ALTO MODA WIDE LEG(8864)', 68200.00, 1, 1);
CALL insert_products('ALTO MODA FLARE(8865)', 59900.00, 1, 1);
CALL insert_products('ALTO MODA RELAXED FIT(8866)', 103600.00, 1, 1);
CALL insert_products('ALTO MODA CROP(8867)', 71300.00, 1, 1);
CALL insert_products('ALTO MODA HIGH RISE(8868)', 89400.00, 1, 1);
CALL insert_products('ALTO MODA LOW RISE(8869)', 120000.00, 1, 1);
CALL insert_products('ALTO MODA MID RISE(8870)', 51000.00, 1, 1);

CALL insert_customers('Cliente1','Cliente1-2','+543516349654','cliente1@gmail.com');
CALL insert_customers('Juan', 'Pérez', '+543516349654', 'juan.perez@gmail.com');
CALL insert_customers('Ana', 'García', '+543512345678', 'ana.garcia@hotmail.com');
CALL insert_customers('Carlos', 'Rodríguez', '+543513456789', 'carlos.rodriguez@yahoo.com');
CALL insert_customers('Laura', 'Martínez', '+543514567890', 'laura.martinez@gmail.com');
CALL insert_customers('Pedro', 'López', '+543515678901', 'pedro.lopez@gmail.com');
CALL insert_customers('María', 'Hernández', '+543516789012', 'maria.hernandez@hotmail.com');
CALL insert_customers('Luis', 'González', '+543517890123', 'luis.gonzalez@yahoo.com');
CALL insert_customers('Sofía', 'Sánchez', '+543518901234', 'sofia.sanchez@gmail.com');
CALL insert_customers('Diego', 'Fernández', '+543519012345', 'diego.fernandez@hotmail.com');
CALL insert_customers('Camila', 'Jiménez', '+543520123456', 'camila.jimenez@gmail.com');

-- Ejemplo para la tabla Admins
CALL insert_admins('admin2', 'admin2@example.com', 'password2');
CALL insert_admins('admin3', 'admin3@example.com', 'password3');

-- Ejemplo para la tabla Brand
CALL insert_brand('Marca2', 'Descripción de Marca2');
CALL insert_brand('Marca3', 'Descripción de Marca3');
CALL insert_brand('Marca4', 'Descripción de Marca4');
CALL insert_brand('Marca5', 'Descripción de Marca5');
CALL insert_brand('Marca6', 'Descripción de Marca6');
CALL insert_brand('Marca7', 'Descripción de Marca7');
CALL insert_brand('Marca8', 'Descripción de Marca8');
CALL insert_brand('Marca9', 'Descripción de Marca9');
CALL insert_brand('Marca10', 'Descripción de Marca10');
CALL insert_brand('Marca11', 'Descripción de Marca11');
CALL insert_brand('Marca12', 'Descripción de Marca12');
CALL insert_brand('Marca13', 'Descripción de Marca13');
CALL insert_brand('Marca14', 'Descripción de Marca14');
CALL insert_brand('Marca15', 'Descripción de Marca15');
CALL insert_brand('Marca16', 'Descripción de Marca16');
CALL insert_brand('Marca17', 'Descripción de Marca17');
CALL insert_brand('Marca18', 'Descripción de Marca18');
CALL insert_brand('Marca19', 'Descripción de Marca19');
CALL insert_brand('Marca20', 'Descripción de Marca20');

CALL insert_suppliers('Proveedor2', 'Calle Falsa 123', '+543512345678', 'proveedor2@example.com');
CALL insert_suppliers('Proveedor3', 'Avenida Siempre Viva 742', '+543513456789', 'proveedor3@example.com');

CALL insert_products('Producto2', 25000.00, 2, 2);
CALL insert_products('Producto3', 30000.00, 3, 3);

-- Ejemplo para la tabla Shop
CALL insert_shop('Compra de Producto1', '2024-01-01 10:00:00', 1000.00, 1, 1, 1, 1);
CALL insert_shop('Compra de Producto2', '2024-02-01 11:00:00', 2000.00, 2, 2, 2, 2);
CALL insert_shop('Compra de Producto3', '2024-03-01 12:00:00', 3000.00, 3, 3, 3, 3);

CALL insert_shop('Compra de ALTO MODA SLIM FIT(8859)', '2024-01-01 10:00:00', 54200.00, 1, 1, 1, 1);
CALL insert_shop('Compra de ALTO MODA REGULAR FIT(8860)', '2024-01-02 11:00:00', 78900.00, 2, 2, 1, 1);
CALL insert_shop('Compra de ALTO MODA BOOTCUT(8861)', '2024-01-03 12:00:00', 63750.00, 3, 3, 1, 1);
CALL insert_shop('Compra de ALTO MODA STRAIGHT LEG(8862)', '2024-01-04 13:00:00', 92400.00, 4, 4, 1, 1);
CALL insert_shop('Compra de ALTO MODA TAPERED(8863)', '2024-01-05 14:00:00', 110500.00, 5, 5, 1, 1);
CALL insert_shop('Compra de ALTO MODA WIDE LEG(8864)', '2024-01-06 15:00:00', 68200.00, 6, 6, 1, 1);
CALL insert_shop('Compra de ALTO MODA FLARE(8865)', '2024-01-07 16:00:00', 59900.00, 7, 7, 1, 1);
CALL insert_shop('Compra de ALTO MODA RELAXED FIT(8866)', '2024-01-08 17:00:00', 103600.00, 8, 8, 1, 1);
CALL insert_shop('Compra de ALTO MODA CROP(8867)', '2024-01-09 18:00:00', 71300.00, 9, 9, 1, 1);
CALL insert_shop('Compra de ALTO MODA HIGH RISE(8868)', '2024-01-10 19:00:00', 89400.00, 10, 10, 1, 1);
CALL insert_shop('Compra de ALTO MODA LOW RISE(8869)', '2024-01-11 20:00:00', 120000.00, 11, 11, 1, 1);
CALL insert_shop('Compra de ALTO MODA MID RISE(8870)', '2024-01-12 21:00:00', 51000.00, 12, 12, 1, 1);

CALL insert_shop('Compra de ALTO MODA SLIM FIT(8859)', '2024-02-01 10:00:00', 54200.00, 1, 2, 1, 1);
CALL insert_shop('Compra de ALTO MODA REGULAR FIT(8860)', '2024-02-02 11:00:00', 78900.00, 2, 3, 1, 1);
CALL insert_shop('Compra de ALTO MODA BOOTCUT(8861)', '2024-02-03 12:00:00', 63750.00, 3, 4, 1, 1);
CALL insert_shop('Compra de ALTO MODA STRAIGHT LEG(8862)', '2024-02-04 13:00:00', 92400.00, 4, 5, 1, 1);
CALL insert_shop('Compra de ALTO MODA TAPERED(8863)', '2024-02-05 14:00:00', 110500.00, 5, 6, 1, 1);
CALL insert_shop('Compra de ALTO MODA WIDE LEG(8864)', '2024-02-06 15:00:00', 68200.00, 6, 7, 1, 1);
CALL insert_shop('Compra de ALTO MODA FLARE(8865)', '2024-02-07 16:00:00', 59900.00, 7, 8, 1, 1);
CALL insert_shop('Compra de ALTO MODA RELAXED FIT(8866)', '2024-02-08 17:00:00', 103600.00, 8, 9, 1, 1);
