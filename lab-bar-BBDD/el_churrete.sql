drop database if exists BarElChurrete;

create database BarElChurrete;

use BarElChurrete;


create table desayuno (
	id_desayuno INT primary key auto_increment,
	nombre VARCHAR(100) not null, 
	descripcion TEXT,
	precio DECIMAL(10,2) not null
);

create table comida_cena (
	id_comida_cena INT primary key auto_increment,
	nombre VARCHAR(100) not null, 
	descripcion TEXT,
	precio DECIMAL(10,2) not null
);

create table carta_churros (
	id_churros INT primary key auto_increment,
	nombre VARCHAR(100) not null, 
	descripcion TEXT,
	precio DECIMAL(10,2) not null
);

create table establecimiento (
	id_establecimiento INT primary key auto_increment,
	direccion VARCHAR(255) not null,
	telefono VARCHAR (15) not null,
	apertura TIME not null,
	cierre TIME not null
);

create table empleados (
	id_empleado INT primary key auto_increment,
	nombre VARCHAR(50) not null,
	apellido VARCHAR(50) not null,
	fecha_nacimiento DATE not null,
	cargo VARCHAR(50) not null
);

create table turnos (
	id_turno INT primary key auto_increment,
	nombre VARCHAR (50) not null,
	hora_inicio TIME not null,
	hora_fin TIME not null
);


create table turnos_empleados (
	id_empleado INT,
	id_turno INT,
	foreign key (id_empleado) references empleados (id_empleado),
	foreign key (id_turno) references turnos (id_turno),
	primary key (id_empleado, id_turno)
);

create table clientes (
	id_cliente INT primary key auto_increment,
	nombre VARCHAR(50) not null,
	apellido VARCHAR(50) not null,
	fecha_nacimiento DATE not null,
	correo VARCHAR(100) not null
);

create table ventas (
	id_venta INT primary key auto_increment,
	id_cliente INT,
	id_empleado INT,
	fecha_hora DATETIME not null,
	foreign key (id_cliente) references clientes (id_cliente),
	foreign key (id_empleado) references empleados (id_empleado)
);

create table ventas_detalles (
	id_venta INT,
	id_desayuno INT,
	id_comida_cena INT,
	id_churros INT,
	cantidad INT not null,
	foreign key (id_venta) references ventas (id_venta),
	foreign key (id_desayuno) references desayuno (id_desayuno),
	foreign key (id_comida_cena) references comida_cena (id_comida_cena),
	foreign key (id_churros) references carta_churros (id_churros),
	primary key (id_venta, id_desayuno, id_comida_cena,id_churros )
);

create table inventario (
	id_inventario INT primary key auto_increment,
	ingrediente VARCHAR(100) not null,
	cantidad DECIMAL(10,2) not null,
	unidad VARCHAR(50) not null
);

create table inventario_movimientos (
	id_movimientos INT primary key auto_increment,
	id_inventario INT,
	tipo ENUM('entrada','salida') not null, 
	cantidad DECIMAL (10,2) not null,
	fecha_hora DATETIME not null,
	foreign key (id_inventario) references inventario (id_inventario)
);

create table promociones (
	id_promo INT primary key auto_increment,
	nombre VARCHAR(100) not null,
	descripcion TEXT,
	descuento DECIMAL (5,2),
	fecha_inicio DATE,
	fecha_fin DATE
);

create table opiniones (
	id_opinion INT primary key auto_increment,
	id_cliente INT,
	id_desayuno INT,
    id_comida_cena INT,
    id_churros INT,
	valoracion INT check (valoracion between 1 and 5),
	opinion TEXT,
	foreign key (id_cliente) references clientes (id_cliente),
	foreign key (id_desayuno) references desayuno (id_desayuno),
	foreign key (id_comida_cena) references comida_cena (id_comida_cena),
	foreign key (id_churros) references carta_churros (id_churros)
);

create table reservas (
	id_reserva INT primary key auto_increment,
	id_cliente INT,
	fecha_hora DATETIME default NOW(),
	num_personas INT not null,
	foreign key (id_cliente) references clientes (id_cliente)
);

create table proveedores (
	id_proveedor INT primary key auto_increment,
	nombre VARCHAR(100) not null,
	contacto VARCHAR(100) not null,
	tipo_ingrediente INT not null
);

create table proveedores_inventario (
	id_proveedor INT,
	id_inventario INT,
	foreign key (id_proveedor) references proveedores (id_proveedor),
	foreign key (id_inventario) references inventario (id_inventario),
	primary key (id_proveedor, id_inventario)
);

create table historial_menu(
	id_historial INT primary key auto_increment,
	id_plato INT,
	tipo_plato ENUM('desayuno', 'comida_cena', 'churro') not null,
	accion ENUM ('añadir', 'modificar', 'eliminar') not null,
	fecha DATE not null
);

DELIMITER $$

CREATE FUNCTION generar_numero_reserva()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE id_reserva INT;
    DECLARE num_reserva_existe INT;

    REPEAT
        SET id_reserva = FLOOR(1 + (RAND() * 100000));
        SELECT COUNT(*) INTO num_reserva_existe FROM Reservas WHERE id_reserva = id_reserva;
    UNTIL num_reserva_existe = 0
    END REPEAT;

    RETURN id_reserva;
END $$

CREATE TRIGGER before_insert_reservas
BEFORE INSERT ON Reservas
FOR EACH ROW
BEGIN
    SET NEW.id_reserva = generar_numero_reserva();
  	SET NEW.fecha_hora = NOW();
END $$

DELIMITER ;
-- Para mejorar el rendimiento en las consultas frecuentes, añadimos índices en columnas como nombre de las tablas Platos, Clientes, Empleados, etc.
create index idx_desayuno_nombre on desayuno(nombre);
create index idx_comida_cena_nombre on comida_cena(nombre);
create index idx_carta_churros_nombre on carta_churros(nombre);
create index idx_clientes_nombre on clientes(nombre);
create index idx_empleados_nombre on empleados(nombre);
create index idx_ventas_fecha_hora on ventas(fecha_hora);

insert into desayuno (id_desayuno, nombre, descripcion, precio) values
(1, 'NA', 'No Aplicable', 0.00),
(2, 'Churros Clásicos', 'Churros tradicionales con azúcar', 1.50),
(3, 'Chocolate Caliente', 'Chocolate caliente espeso', 2.00),
(4, 'Café', 'Café negro', 1.20),
(5, 'Tostada de Aguacate', 'Tostada con aguacate y huevo', 3.00),
(6, 'Croissant', 'Croissant francés con mantequilla', 2.50),
(7, 'Panqueques', 'Panqueques con sirope de arce', 3.50),
(8, 'Huevos Rancheros', 'Huevos con salsa, frijoles y tortillas', 4.00),
(9, 'Batido de Frutas', 'Batido de frutas frescas', 2.80),
(10, 'Yogur con Granola', 'Yogur natural con granola y frutas', 3.00),
(11, 'Sandwich de Jamón y Queso', 'Sandwich con jamón y queso', 3.50),
(12, 'Bagel con Salmón Ahumado', 'Bagel con salmón ahumado y queso crema', 5.00);


insert into comida_cena (id_comida_cena, nombre, descripcion, precio) values
(1, 'NA', 'No Aplicable', 0.00),
(2, 'Ensalada César', 'Ensalada con pollo y aderezo César', 5.00),
(3, 'Bistec a la Parrilla', 'Bistec servido con papas fritas', 7.00),
(4, 'Pasta Alfredo', 'Pasta con salsa Alfredo y pollo', 6.50),
(5, 'Hamburguesa Clásica', 'Hamburguesa con queso, lechuga y tomate', 6.00),
(6, 'Tacos de Pollo', 'Tacos de pollo con guacamole y pico de gallo', 5.50),
(7, 'Sopa de Tomate', 'Sopa de tomate con albahaca', 4.00),
(8, 'Pollo a la Parrilla', 'Pollo a la parrilla con verduras', 7.00),
(9, 'Pizza Margarita', 'Pizza con salsa de tomate, mozzarella y albahaca', 8.00),
(10, 'Lasagna', 'Lasagna con carne y salsa bechamel', 7.50),
(11, 'Salmón al Horno', 'Salmón al horno con hierbas y limón', 9.00);

insert into carta_churros (id_churros, nombre, descripcion, precio) values
(1, 'NA', 'No Aplicable', 0.00),
(2, 'Churros con Chocolate', 'Churros servidos con chocolate caliente', 3.50),
(3, 'Churros Rellenos', 'Churros rellenos de crema pastelera', 2.50),
(4, 'Churros con Canela', 'Churros espolvoreados con canela y azúcar', 2.00),
(5, 'Churros con Dulce de Leche', 'Churros rellenos de dulce de leche', 3.00),
(6, 'Churros con Nata', 'Churros servidos con nata montada', 2.50),
(7, 'Churros con Frutas', 'Churros servidos con frutas frescas', 3.50),
(8, 'Churros con Helado', 'Churros servidos con una bola de helado', 4.00);

insert into establecimiento (direccion, telefono, apertura, cierre) VALUES
('Calle Falsa 123', '555-1234', '08:00:00', '23:00:00');

insert into empleados (id_empleado, nombre, apellido, fecha_nacimiento, cargo) VALUES
(1, 'Juan', 'Pérez', '1990-01-15', 'Cocinero'),
(2, 'María', 'López', '1985-07-22', 'Mesera'),
(3, 'Carlos', 'Gómez', '1992-11-10', 'Barista'),
(4, 'Ana', 'Martínez', '1998-05-30', 'Gerente'),
(5, 'Luis', 'Sánchez', '1995-03-17', 'Ayudante de Cocina'),
(6, 'Pedro', 'Hernández', '1991-02-25', 'Cocinero'),
(7, 'Sofía', 'Ramírez', '1986-08-13', 'Mesera'),
(8, 'Miguel', 'Torres', '1989-12-05', 'Barista'),
(9, 'Laura', 'Jiménez', '1993-07-19', 'Cajera'),
(10, 'Jorge', 'Castro', '1994-10-23', 'Repostero'),
(11, 'Elena', 'Vega', '1997-09-14', 'Cocinera'),
(12, 'Rafael', 'Cruz', '1990-04-10', 'Ayudante de Cocina'),
(13, 'Lucía', 'Molina', '1987-11-29', 'Mesera'),
(14, 'Diego', 'Gutiérrez', '1996-03-02', 'Barista'),
(15, 'Marta', 'Ríos', '1998-06-27', 'Cajera'),
(16, 'Andrés', 'Moreno', '1984-01-21', 'Repostero'),
(17, 'Paula', 'Ortega', '1992-09-18', 'Cocinera'),
(18, 'Rubén', 'Santos', '1989-05-07', 'Ayudante de Cocina'),
(19, 'Clara', 'Paredes', '1993-12-15', 'Mesera'),
(20, 'Óscar', 'Reyes', '1985-11-24', 'Barista');


insert into turnos (id_turno, nombre, hora_inicio, hora_fin) VALUES
(1, 'Mañana', '06:00:00', '14:00:00'),
(2, 'Tarde', '14:00:00', '22:00:00'),
(3, 'Noche', '22:00:00', '06:00:00'),
(4, 'Refuerzo', '12:00:00', '18:00:00');

insert into turnos_empleados (id_empleado, id_turno) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3),
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4);

insert into clientes (id_cliente, nombre, apellido, fecha_nacimiento, correo) VALUES
(1, 'Pedro', 'García', '1988-02-14', CONCAT('pgarcia', FLOOR(1000 + RAND() * 9000), 'pedro.garcia@mail.com')),
(2, 'Laura', 'Hernández', '1991-09-29',  CONCAT('lhernan', FLOOR(1000 + RAND() * 9000), 'laura.hernandez@mail.com')),
(3, 'José', 'Fernández', '1975-06-07', 'jose.fernandez@mail.com'),
(4, 'Marta', 'Rodríguez', '1983-12-25', 'marta.rodriguez@mail.com'),
(5, 'Miguel', 'Ruiz', '2000-01-20', 'miguel.ruiz@mail.com'),
(6, 'Sandra', 'López', '1982-03-12', 'sandra.lopez@mail.com'),
(7, 'Ricardo', 'Martínez', '1995-07-07', 'ricardo.martinez@mail.com'),
(8, 'Natalia', 'Sánchez', '1990-10-30', 'natalia.sanchez@mail.com'),
(9, 'Hugo', 'Gómez', '1987-01-11', 'hugo.gomez@mail.com'),
(10, 'Carmen', 'Jiménez', '1984-04-20', 'carmen.jimenez@mail.com'),
(11, 'Francisco', 'Torres', '1993-05-05', 'francisco.torres@mail.com'),
(12, 'Patricia', 'Molina', '1986-06-25', 'patricia.molina@mail.com'),
(13, 'Álvaro', 'Moreno', '1999-08-08', 'alvaro.moreno@mail.com'),
(14, 'Sergio', 'Ortega', '1992-11-13', 'sergio.ortega@mail.com'),
(15, 'Raquel', 'Ríos', '1989-12-22', 'raquel.rios@mail.com'),
(16, 'Isabel', 'Reyes', '1981-02-28', 'isabel.reyes@mail.com'),
(17, 'Gabriel', 'Vega', '1978-10-15', 'gabriel.vega@mail.com'),
(18, 'Adriana', 'Castro', '1996-11-23', 'adriana.castro@mail.com'),
(19, 'Javier', 'Cruz', '1985-01-09', 'javier.cruz@mail.com'),
(20, 'Rosa', 'Ramírez', '1997-03-17', 'rosa.ramirez@mail.com');

insert into ventas (id_venta, id_cliente, id_empleado, fecha_hora) VALUES
(1, 1, 1, '2023-07-15 08:30:00'), (2, 2, 2, '2023-07-15 09:00:00'),
(3, 3, 3, '2023-07-15 10:00:00'), (4, 4, 4, '2023-07-15 11:00:00'),
(5, 5, 5, '2023-07-15 12:00:00'), (6, 6, 6, '2023-07-15 13:00:00'),
(7, 7, 7, '2023-07-15 14:00:00'), (8, 8, 8, '2023-07-15 15:00:00'),
(9, 9, 9, '2023-07-15 16:00:00'), (10, 10, 10, '2023-07-15 17:00:00'),
(11, 11, 11, '2023-07-15 18:00:00'), (12, 12, 12, '2023-07-15 19:00:00'),
(13, 13, 13, '2023-07-15 20:00:00'), (14, 14, 14, '2023-07-15 21:00:00'),
(15, 15, 15, '2023-07-15 22:00:00'), (16, 16, 16, '2023-07-15 23:00:00'),
(17, 17, 17, '2023-07-16 00:00:00'), (18, 18, 18, '2023-07-16 01:00:00'),
(19, 19, 19, '2023-07-16 02:00:00'), (20, 20, 20, '2023-07-16 03:00:00'),
(21, 1, 1, '2023-07-16 08:30:00'), (22, 2, 2, '2023-07-16 09:00:00'),
(23, 3, 3, '2023-07-16 10:00:00'), (24, 4, 4, '2023-07-16 11:00:00'),
(25, 5, 5, '2023-07-16 12:00:00'), (26, 6, 6, '2023-07-15 23:00:00'),
(27, 7, 7, '2023-07-16 14:00:00'), (28, 8, 8, '2023-07-15 15:00:00'),
(29, 9, 9, '2023-07-16 16:00:00'), (30, 10, 10, '2023-07-15 09:00:00');


insert into ventas_detalles (id_venta, id_desayuno, id_comida_cena, id_churros, cantidad) values
(1, 2, 3, 2, 1),
(2, 3, 4, 3, 2),
(3, 4, 5, 4, 1),
(4, 5, 6, 5, 2),
(5, 6, 7, 6, 3),
(6, 7, 8, 7, 1),
(7, 8, 9, 8, 2),
(8, 9, 10, 2, 1),
(9, 10, 2, 3, 3),
(10, 11, 3, 4, 1),
(11, 12, 4, 5, 2),
(12, 2, 5, 6, 3),
(13, 3, 6, 7, 1),
(14, 4, 7, 8, 2),
(15, 5, 8, 2, 3),
(16, 6, 9, 3, 1),
(17, 7, 10, 4, 2),
(18, 8, 2, 5, 1),
(19, 9, 3, 6, 3),
(20, 10, 4, 7, 1),
(21, 11, 5, 8, 2),
(22, 12, 6, 2, 1),
(23, 2, 7, 3, 2),
(24, 3, 8, 4, 1),
(25, 4, 9, 5, 3),
(26, 5, 10, 6, 1),
(27, 6, 2, 7, 2),
(28, 7, 3, 8, 1),
(29, 8, 4, 2, 3),
(30, 9, 5, 3, 1);


insert into inventario (id_inventario, ingrediente, cantidad, unidad)
VALUES
(1, 'Harina', 100.00, 'kg'), (2, 'Azúcar', 50.00, 'kg'),
(3, 'Chocolate', 25.00, 'kg'), (4, 'Leche', 200.00, 'litros'),
(5, 'Huevos', 300.00, 'unidades'), (6, 'Mantequilla', 30.00, 'kg'),
(7, 'Café', 15.00, 'kg'), (8, 'Frutas', 100.00, 'kg'),
(9, 'Yogur', 50.00, 'litros'), (10, 'Jamón', 20.00, 'kg');

INSERT INTO inventario_movimientos (id_movimientos, id_inventario, tipo, cantidad, fecha_hora)
VALUES
(1, 1, 'entrada', 20.00, '2023-07-14 10:00:00'), (2, 2, 'salida', 5.00, '2023-07-15 14:00:00'),
(3, 3, 'entrada', 10.00, '2023-07-16 09:00:00'), (4, 4, 'salida', 30.00, '2023-07-17 18:00:00'),
(5, 5, 'entrada', 50.00, '2023-07-18 12:00:00'), (6, 6, 'salida', 10.00, '2023-07-14 11:00:00'),
(7, 7, 'entrada', 5.00, '2023-07-15 15:00:00'), (8, 8, 'salida', 20.00, '2023-07-16 10:00:00'),
(9, 9, 'entrada', 10.00, '2023-07-17 19:00:00'), (10, 10, 'salida', 5.00, '2023-07-18 13:00:00');

INSERT INTO promociones (id_promo, nombre, descripcion, descuento, fecha_inicio, fecha_fin)
VALUES
(1, 'Descuento de Verano', '10% de descuento en todos los platos', 10.00, '2023-06-01', '2023-08-31'),
(2, '2x1 en Churros', 'Compra 1 churro y recibe otro gratis', 50.00, '2023-07-01', '2023-07-31'),
(3, 'Menú del Día', 'Menú especial a precio reducido', 20.00, '2023-07-15', '2023-07-15'),
(4, 'Descuento para Estudiantes', '15% de descuento para estudiantes', 15.00, '2023-09-01', '2023-12-31'),
(5, 'Descuento de Invierno', '10% de descuento en bebidas calientes', 10.00, '2023-12-01', '2024-02-28');

INSERT INTO opiniones (id_cliente, id_desayuno, id_comida_cena, id_churros, valoracion, opinion) VALUES
(1, 1, NULL, NULL, 5, 'Excelente, los churros estaban perfectos.'),
(2, NULL, 2, NULL, 4, 'La ensalada estaba buena, pero podría mejorar el aderezo.'),
(3, NULL, NULL, 3, 5, 'Los churros con canela fueron deliciosos.'),
(4, 4, NULL, NULL, 3, 'La tostada estaba bien, pero esperaba más sabor.'),
(5, NULL, 5, NULL, 4, 'Los tacos de pollo estaban sabrosos, pero podrían ser un poco más picantes.'),
(6, NULL, NULL, 7, 5, 'Los churros con helado son una combinación increíble.'),
(7, 6, NULL, NULL, 4, 'Los panqueques estaban esponjosos, pero un poco menos sirope estaría mejor.'),
(8, NULL, 7, NULL, 5, 'El pollo a la parrilla estaba perfectamente cocido y muy sabroso.'),
(9, NULL, NULL, 4, 2, 'Churros con dulce de leche estaban demasiado grasosos para mi gusto.'),
(10, 9, NULL, NULL, 4, 'La lasagna estaba buena, pero el queso podría estar más derretido.'),
(11, NULL, 1, NULL, 5, 'El bistec a la parrilla fue una excelente elección, muy jugoso.'),
(12, NULL, NULL, 5, 5, 'Churros con frutas son una excelente opción para un postre.'),
(13, 3, NULL, NULL, 2, 'El café estaba demasiado amargo para mi gusto.'),
(14, NULL, NULL, 6, 4, 'Churros con nata estaban muy bien, pero podrían usar un poco más de nata.'),
(15, 7, NULL, NULL, 5, 'Huevos Rancheros fue uno de los mejores desayunos que he probado.'),
(16, NULL, 8, NULL, 3, 'La pizza Margarita estaba buena, pero no era tan caliente como esperaba.'),
(17, NULL, NULL, 2, 1, 'Churros rellenos estaban muy secos y sin sabor.'),
(18, 10, NULL, NULL, 5, 'El Sandwich de Jamón y Queso estaba excelente, bien preparado.'),
(19, NULL, NULL, 1, 4, 'Los churros con chocolate eran muy buenos, pero el chocolate estaba un poco frío.'),
(20, NULL, NULL, 7, 5, 'El churro con helado es lo mejor que he probado. Perfecto para el postre.');


INSERT INTO reservas (id_reserva, id_cliente, fecha_hora, num_personas) VALUES
(1, 1, now(), 4), (2, 2, now(), 2),
(3, 3, now(), 6), (4, 4, now(), 3),
(5, 5, now(), 5), (6, 6, now(), 4),
(7, 7, now(), 2), (8, 8, now(), 6);

INSERT INTO proveedores (id_proveedor, nombre, contacto, tipo_ingrediente) VALUES
(1, 'Distribuidora de Harina SA', 'contacto@harinas.com', 1),
(2, 'Azúcar y Más', 'ventas@azucarymas.com', 2),
(3, 'ChocoProveedores', 'info@chocopro.com', 3),
(4, 'Lácteos del Norte', 'contacto@lacteosnorte.com', 4),
(5, 'Huevos Frescos SA', 'huevos@frescos.com', 5);

INSERT INTO proveedores_inventario (id_proveedor, id_inventario) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO historial_menu (id_historial, id_plato, tipo_plato, accion, fecha) VALUES
(1, 1, 'desayuno', 'añadir', '2023-07-10'),
(2, 2, 'desayuno', 'modificar', '2023-07-12'),
(3, 3, 'comida_cena', 'eliminar', '2023-07-13'),
(4, 4, 'comida_cena', 'añadir', '2023-07-14'),
(5, 5, 'churro', 'modificar', '2023-07-15');

-- consultas:
SELECT 
    DATE(fecha) AS fecha,
    SUM(total) AS total_ventas_diarias
FROM 
    Pedidos
GROUP BY 
    DATE(fecha)
ORDER BY 
    fecha;
    
-- Ventas semanales:
   
SELECT 
    YEAR(fecha) AS año,
    WEEK(fecha) AS semana,
    SUM(total) AS total_ventas_semanales
FROM 
    Pedidos
GROUP BY 
    año, semana
ORDER BY 
    año, semana;
    
-- Ventas mensuales:
   
SELECT 
    YEAR(fecha) AS año,
    MONTH(fecha) AS mes,
    SUM(total) AS total_ventas_mensuales
FROM 
    Pedidos
GROUP BY 
    año, mes
ORDER BY 
    año, mes;


