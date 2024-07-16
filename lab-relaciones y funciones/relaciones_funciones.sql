drop database if exists empresa;

create database empresa;

use empresa;

create table departamentos (
	departamento_id INT primary key auto_increment,
	nombre VARCHAR(100) not null
);

create table empleados (
	empleado_id INT primary key auto_increment,
	nombre VARCHAR(100) not null,
	salario DECIMAL(10,2) not null,
	departamento_id INT,
	constraint fk_departamento_empleado foreign key (departamento_id)
	references departamentos (departamento_id)
);

insert into departamentos (nombre) values
('Recursos Humanos'),
('Tecnología'),
('Finanzas'),
('Marketing'),
('Ventas');

insert into empleados (nombre, salario, departamento_id) values 
('Juan Pérez', 50000.00, 1),
('María Gómez', 60000.00, 2),
('Carlos Sánchez', 55000.00, 1),
('Ana López', 58000.00, 3),
('Luis Torres', 62000.00, 2),
('Elena Ramírez', 49000.00, 4),
('Miguel Fernández', 53000.00, 5),
('Sofía Moreno', 56000.00, 1),
('Gabriel Hernández', 60000.00, 3),
('Lucía Martínez', 51000.00, 4);

-- Ver todos los empleados con sus respectivos departamentos
select e.nombre as empleado, e.salario, d.nombre as departamento
from empleados e
join departamentos d on e.departamento_id = d.departamento_id;


create table proyectos (
	proyecto_id INT primary key auto_increment,
	nombre VARCHAR (100) not null
);

create table empleado_proyecto (
	empleado_id INT,
	proyecto_id INT,
	foreign key (empleado_id) references empleados (empleado_id),
	foreign key (proyecto_id) references proyectos (proyecto_id)
);

create table detalles_empleado (
	empleado_id INT primary key,
	direccion VARCHAR(255) not null,
	telefono VARCHAR(15) not null,
	foreign key (empleado_id) references empleados (empleado_id) on delete cascade 
);

insert into detalles_empleado (empleado_id, direccion, telefono) values
(1, '123 Calle Principal, Ciudad', '1234567890'),
(2, '456 Avenida Secundaria, Ciudad', '0987654321'),
(3, '789 Calle Tercera, Ciudad', '1122334455'),
(4, '101 Calle Cuarta, Ciudad', '5566778899'),
(5, '202 Calle Quinta, Ciudad', '6677889900'),
(6, '303 Calle Sexta, Ciudad', '1231231234'),
(7, '404 Calle Séptima, Ciudad', '4564564567'),
(8, '505 Calle Octava, Ciudad', '7897897890'),
(9, '606 Calle Novena, Ciudad', '3213214321'),
(10, '707 Calle Décima, Ciudad', '6546546543');

select e.nombre as empleado, e.salario, d.nombre as departamento, de.direccion, de.telefono
from empleados e
join departamentos d ON e.departamento_id = d.departamento_id
join detalles_empleado de on e.empleado_id = de.empleado_id;

-- ver la estructura de las tablas y las relaciones establecidas:
describe detalles_empleado;

-- ver claves foraneas:
show create table detalles_empleado;


delimiter // 

create function calcular_bonificacion(emp_id INT)
returns decimal (10,2)
deterministic 
begin
	declare salario decimal(10,2);
	declare bonificacion decimal(10,2);

-- obtener el salario 
	select e.salario into salario
	from empleados e
	where e.empleado_id = emp_id;
-- calcular la bonificacion - 10% del salario
	set bonificacion = salario * 0.10;
	return bonificacion; 
end // 

delimiter ;
SELECT calcular_bonificacion(4) AS bonificacion;

-- Eliminar la restricción de integridad referencial nombrada
ALTER TABLE empleados DROP FOREIGN KEY fk_departamento_empleado;

