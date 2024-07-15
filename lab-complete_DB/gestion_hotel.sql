DROP DATABASE IF EXISTS complete_DB;

CREATE DATABASE complete_DB;

USE complete_DB;


CREATE TABLE hotel (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
CREATE TABLE habitacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    hotel_id INT,
    cliente_id INT UNIQUE,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    habitacion_id INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    fecha_checkin DATE,
    fecha_checkout DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (habitacion_id) REFERENCES habitacion(id)
);

CREATE TABLE servicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE cliente_servicio (
    cliente_id INT,
    servicio_id INT,
    PRIMARY KEY (cliente_id, servicio_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (servicio_id) REFERENCES servicio(id)
);
INSERT INTO hotel (nombre, direccion) VALUES
('Hotel A', '123 Calle Principal'),
('Hotel B', '456 Avenida Secundaria'),
('Hotel C', '789 Avenida Tercera');

INSERT INTO habitacion (numero, tipo, hotel_id, estado) VALUES
('101', 'Simple', 1, 'Disponible'),
('102', 'Doble', 1, 'Disponible'),
('201', 'Suite', 2, 'Ocupado'),
('202', 'Simple', 2, 'Disponible'),
('301', 'Doble', 3, 'Ocupado'),
('302', 'Suite', 3, 'Disponible'),
('303', 'Simple', 3, 'Disponible'),
('304', 'Doble', 3, 'Ocupado'),
('305', 'Suite', 3, 'Disponible'),
('306', 'Simple', 3, 'Disponible');

INSERT INTO cliente (nombre, email) VALUES
('Juan Perez', 'juan@example.com'),
('Maria Gomez', 'maria@example.com'),
('Carlos Martinez', 'carlos@example.com'),
('Ana Lopez', 'ana@example.com'),
('Luis Fernandez', 'luis@example.com'),
('Laura Torres', 'laura@example.com'),
('Miguel Ramirez', 'miguel@example.com'),
('Sofia Herrera', 'sofia@example.com'),
('Jose Garcia', 'jose@example.com'),
('Elena Sanchez', 'elena@example.com');

INSERT INTO reserva (cliente_id, habitacion_id, fecha_inicio, fecha_fin, estado, fecha_checkin, fecha_checkout) VALUES
(1, 1, '2024-07-01', '2024-07-05', 'Confirmada', '2024-07-01', '2024-07-05'),
(2, 2, '2024-07-02', '2024-07-06', 'Pendiente', NULL, NULL),
(3, 3, '2024-07-03', '2024-07-07', 'Confirmada', '2024-07-03', '2024-07-07'),
(4, 4, '2024-07-04', '2024-07-08', 'Cancelada', NULL, NULL),
(5, 5, '2024-07-05', '2024-07-09', 'Confirmada', '2024-07-05', '2024-07-09'),
(6, 6, '2024-07-06', '2024-07-10', 'Pendiente', NULL, NULL),
(7, 7, '2024-07-07', '2024-07-11', 'Confirmada', '2024-07-07', '2024-07-11'),
(8, 8, '2024-07-08', '2024-07-12', 'Cancelada', NULL, NULL),
(9, 9, '2024-07-09', '2024-07-13', 'Confirmada', '2024-07-09', '2024-07-13'),
(10, 10, '2024-07-10', '2024-07-14', 'Pendiente', NULL, NULL);

INSERT INTO servicio (nombre, descripcion) VALUES
('Desayuno', 'Desayuno buffet'),
('Spa', 'Acceso al spa y masajes'),
('Gimnasio', 'Acceso al gimnasio'),
('Piscina', 'Acceso a la piscina'),
('Transporte', 'Servicio de transporte al aeropuerto'),
('Lavandería', 'Servicio de lavandería'),
('WiFi', 'Acceso a internet WiFi'),
('Minibar', 'Acceso al minibar en la habitación'),
('Estacionamiento', 'Acceso al estacionamiento'),
('Room Service', 'Servicio a la habitación');


INSERT INTO cliente_servicio (cliente_id, servicio_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 3),
(7, 5),
(7, 7),
(8, 9),
(8, 10),
(9, 2),
(9, 4),
(10, 6),
(10, 8);


-- Actualizar estado de las reservas basado en las fechas de check-in y check-out
UPDATE reserva
SET estado = 'En curso'
WHERE fecha_checkin <= CURDATE()
  AND fecha_checkout >= CURDATE();

UPDATE reserva
SET estado = 'Finalizada'
WHERE fecha_checkout < CURDATE();

-- Mostrar el resultado actualizado de la tabla Reserva
SELECT * FROM reserva;

SELECT r.id AS reserva_id, h.numero AS numero_habitacion, h.tipo AS tipo_habitacion, c.nombre AS nombre_cliente
FROM reserva r
JOIN habitacion h ON r.habitacion_id = h.id
JOIN cliente c ON r.cliente_id = c.id
WHERE r.estado = 'Confirmada';

SELECT cs.cliente_id, s.id AS servicio_id, s.nombre AS nombre_servicio, s.descripcion AS descripcion_servicio
FROM cliente_servicio cs
JOIN servicio s ON cs.servicio_id = s.id
WHERE cs.cliente_id = 1;


-- Obtener la cantidad total de reservas realizadas en un hotel especifico en un mes determinado:
SELECT COUNT(*) AS total_reservas
FROM reserva r
JOIN habitacion h ON r.habitacion_id = h.id
JOIN hotel ho ON h.hotel_id = ho.id
WHERE ho.nombre = 'Hotel A'
  AND MONTH(r.fecha_inicio) = 7
  AND YEAR(r.fecha_inicio) = 2024;
 
 -- Crear índice en la columna estado de la tabla habitacion
CREATE INDEX idx_estado ON habitacion(estado);

-- Simulación de reservas simultáneas con transacciones
START TRANSACTION;

-- Reserva 1
INSERT INTO reserva (cliente_id, habitacion_id, fecha_inicio, fecha_fin, estado, fecha_checkin, fecha_checkout)
VALUES (1, 1, '2024-08-01', '2024-08-05', 'Pendiente', NULL, NULL);

-- Verificar disponibilidad
SELECT * FROM reserva WHERE habitacion_id = 1 AND fecha_inicio <= '2024-08-05' AND fecha_fin >= '2024-08-01' FOR UPDATE;

-- Reserva 2
INSERT INTO reserva (cliente_id, habitacion_id, fecha_inicio, fecha_fin, estado, fecha_checkin, fecha_checkout)
VALUES (2, 1, '2024-08-01', '2024-08-05', 'Pendiente', NULL, NULL);

COMMIT;


-- Modificar el trigger para actualizar el estado de la habitación
DELIMITER //

CREATE TRIGGER after_insert_reserva
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    DECLARE habitacion_estado VARCHAR(50);
    
    -- Obtener el estado actual de la habitación
    SELECT estado INTO habitacion_estado
    FROM habitacion
    WHERE id = NEW.habitacion_id
    FOR UPDATE;
    
    -- Actualizar el estado de la habitación según la reserva
    UPDATE habitacion
    SET estado = CASE 
                    WHEN NEW.estado = 'Confirmada' THEN 'Ocupado'
                    WHEN NEW.estado = 'Cancelada' THEN 'Disponible'
                    ELSE habitacion_estado
                END
    WHERE id = NEW.habitacion_id;
    
END//

DELIMITER ;

-- Consulta anidada: obtener todos los servicios reservados por cada cliente junto con sus nombres y detalles de servicios.
SELECT c.nombre AS nombre_cliente, 
       (SELECT GROUP_CONCAT(s.nombre SEPARATOR ', ')
        FROM servicio s
        JOIN cliente_servicio cs ON s.id = cs.servicio_id
        WHERE cs.cliente_id = c.id
       ) AS servicios_reservados
FROM cliente c;

