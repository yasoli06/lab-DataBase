-- PARTE 1: Base de Datos para un Supermercado
-- Drop de la base de datos labDataType si existe
DROP DATABASE IF EXISTS labDataType;

-- Creación de la base de datos labDataType
CREATE DATABASE labDataType;

-- Usar la base de datos labDataType
USE labDataType;


CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

INSERT INTO Clientes (id_cliente, nombre, direccion, telefono, email) VALUES
(1, 'Cliente 1', 'Dirección A', '111222333', 'cliente1@example.com'),
(2, 'Cliente 2', 'Dirección B', '444555666', 'cliente2@example.com'),
(3, 'Cliente 3', 'Dirección C', '777888999', 'cliente3@example.com'),
(4, 'Cliente 4', 'Dirección D', '112233445', 'cliente4@example.com'),
(5, 'Cliente 5', 'Dirección E', '556677889', 'cliente5@example.com');

INSERT INTO Proveedores (id_proveedor, nombre_proveedor, direccion, telefono, email) VALUES
(1, 'Proveedor 1', 'Dirección 1', '123456789', 'proveedor1@example.com'),
(2, 'Proveedor 2', 'Dirección 2', '987654321', 'proveedor2@example.com'),
(3, 'Proveedor 3', 'Dirección 3', '555123456', 'proveedor3@example.com');

INSERT INTO Productos (id_producto, nombre_producto, precio, id_proveedor) VALUES
(1, 'Producto 1', 10.99, 1),
(2, 'Producto 2', 20.49, 1),
(3, 'Producto 3', 30.00, 2),
(4, 'Producto 4', 15.75, 2),
(5, 'Producto 5', 50.10, 3),
(6, 'Producto 6', 5.99, 3),
(7, 'Producto 7', 22.50, 1),
(8, 'Producto 8', 35.99, 2),
(9, 'Producto 9', 45.00, 3),
(10, 'Producto 10', 12.49, 1);


-- los IDS se utilizan como INT pq son valores numericos y enteros.
-- los nombres(cliente, producto y proveedor), se utiliza VARCHAR para permitir la longitud de la cadena, lo mismo que para los correos eletronicos. 
-- las direcciones se utiliza VARCHAR(255) para asegurar que hay la longitud suficiente para almacenar los datos
-- los telefonos se utiliza VARCHAR pq a depender del país, se puede introducir letra, entonces entran como caracteres
-- los precios se utiliza el DECIMAL, para almacenar valores con precisión y que no solo sean enteros, pero que sean hasta 2 decimales. 





