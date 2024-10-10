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

