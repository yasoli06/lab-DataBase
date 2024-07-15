-- Drop de la base de datos funciones si existe
DROP DATABASE IF EXISTS funciones;

-- Creación de la base de datos funciones
CREATE DATABASE funciones;

-- Usar la base de datos funciones
USE funciones;


-- 1. Gimnasio
-- Entidades y Atributos:
-- Miembros: número de identificación, nombre, dirección, teléfono, correo electrónico
-- Entrenadores: nombre, fecha de nacimiento, especialidad
-- Clases: nombre, horario, duración
-- Reservaciones: fecha, hora
-- Equipos: nombre, tipo, estado

-- Relaciones:
-- Un miembro puede reservar uno o más equipos.
-- Un entrenador puede impartir una o más clases.
-- Un miembro puede tomar una o más clases.
-- Una clase puede tener uno o más miembros.

-- Diagrama ER: 
CREATE TABLE Miembros (
	id_miembro INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	direccion VARCHAR (200),
	telefono VARCHAR(20),
	email VARCHAR(100)
);
CREATE TABLE Entrenadores (
	id_entrenador INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	fecha_nacimiento DATE,
	especialidad VARCHAR(50)
);

CREATE TABLE Clases (
	id_clase INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	horario TIME NOT NULL,
	duracion INT NOT NULL
);

CREATE TABLE MiembrosClases(
	id_miembro INT,
	id_clase INT,
	PRIMARY KEY (id_miembro, id_clase),
	FOREIGN KEY (id_miembro) REFERENCES Miembros(id_miembro),
	FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

CREATE TABLE Equipos (
	id_equipo INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	tipo VARCHAR(50),
	estado VARCHAR (50)
);

CREATE TABLE Reservas(
	id_reserva INT PRIMARY KEY AUTO_INCREMENT,
	id_miembro INT,
	id_equipo INT,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	FOREIGN KEY (id_miembro) REFERENCES Miembros(id_miembro),
	FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- 2. Clinica Veterinaria
-- Entidades y Atributos:
-- Mascotas: nombre, especie, raza, edad, historial médico
-- Propietarios: nombre, dirección, teléfono, correo electrónico
-- Veterinarios: nombre, especialidad, años de experiencia
-- Citas: fecha, hora, motivo
-- Tratamientos: nombre, descripción, costo

-- Relaciones:
-- Un propietario puede tener una o más mascotas.
-- Una mascota puede tener una o más citas.
-- Un veterinario puede atender una o más citas.
-- Una cita puede incluir uno o más tratamientos.

CREATE TABLE Proprietarios(
	id_proprietario INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	direccion VARCHAR (200),
	telefono VARCHAR (20),
	email VARCHAR(200)
);

CREATE TABLE Mascotas(
	id_mascota INT PRIMARY KEY AUTO_INCREMENT,
	id_proprietario INT,
	nombre VARCHAR (200) NOT NULL,
	especie VARCHAR (50),
	raza VARCHAR (50),
	edad INT,
	historial TEXT,
	FOREIGN KEY (id_proprietario) references Proprietarios(id_proprietario)
);
CREATE TABLE Veterinarios (
    id_veterinario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50)
);
CREATE TABLE Citas (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT,
    id_veterinario INT,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Motivo TEXT,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);

CREATE TABLE Tratamientos (
    id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    costo DECIMAL(10, 2)
);
CREATE TABLE CitasTratamientos (
    id_cita INT,
    id_tratamiento INT,
    PRIMARY KEY (id_cita, id_tratamiento),
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamientos(id_tratamiento)
);

-- 3.Supermercado
-- Entidades y Atributos:
-- Productos: ID, nombre, descripción, precio, stock, categoríaID
-- Categorías: ID, nombre, descripción
-- Clientes: ID, nombre, dirección, teléfono, correo electrónico
-- Empleados: ID, nombre, puesto, fecha de contratación, salario
-- Ventas: ID, clienteID, empleadoID, fecha, total
-- DetalleVentas: ID, ventaID, productoID, cantidad, precio

-- Relaciones:
-- Un producto pertenece a una categoría.
-- Una categoría puede tener muchos productos.
-- Un cliente puede realizar muchas ventas.
-- Una venta es realizada por un cliente y procesada por un empleado.
-- Una venta puede incluir uno o más productos (detalle de la venta).
-- Un producto puede aparecer en muchos detalles de ventas.

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(100)
);
CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    fechaContratacion DATE,
    salario DECIMAL(10, 2)
);
CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
   	fecha DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);
CREATE TABLE DetalleVentas (
    id_detalleVenta INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);




