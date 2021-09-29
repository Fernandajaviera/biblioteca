1.CREATE DATABASE Biblioteca;
\c biblioteca;


CREATE TABLE socios(
	socio_id serial PRIMARY KEY,
	rut VARCHAR(12),
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	direccion VARCHAR(150),
	telefono VARCHAR(12)
);

CREATE TABLE autor(
  autor_id serial PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento VARCHAR(4),
  fecha_fallecimiento VARCHAR(4),
  tipo VARCHAR(100)
);

CREATE TABLE libros(
	isbn VARCHAR(15) PRIMARY KEY,
	titulo VARCHAR(50),
	paginas integer,
	autor_id integer REFERENCES autor(autor_id),
	coautor_id integer REFERENCES autor(autor_id)
);

CREATE TABLE prestamos(
	prestamo_id serial PRIMARY KEY,
	isbn VARCHAR(15) REFERENCES libros(isbn),
	socio_id integer REFERENCES socios(socio_id),
	fecha_inicio VARCHAR(10),
	fecha_prestamo VARCHAR (10),
	fecha_entrega VARCHAR(10)
);

2. Insertar los registros correspondientes:

Tabla socios

INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES ('2222222-2', 'ANA', 'PÉREZ', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES ('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444');
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES ('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');


 socio_id |    rut    | nombre  | apellido |      direccion      | telefono  
----------+-----------+---------+----------+---------------------+-----------
        1 | 1111111-1 | JUAN    | SOTO     | AVENIDA 1, SANTIAGO | 911111111
        2 | 2222222-2 | ANA     | PÉREZ    | PASAJE 2, SANTIAGO  | 922222222
        3 | 4444444-4 | ESTEBAN | JEREZ    | AVENIDA 3, SANTIAGO | 944444444
        4 | 5555555-5 | SILVANA | MUÑOZ    | PASAJE 3, SANTIAGO  | 955555555
        5 | 3333333-3 | SANDRA  | AGUILAR  | AVENIDA 2, SANTIAGO | 933333333
(5 rows)
--------------------------------------------------------------------------------------------------
Tabla autor

iNSERT INTO autor(autor_id, nombre, apellido, fecha_nacimiento, fecha_fallecimiento, tipo) VALUES (3, 'JOSE', 'SALGADO', '1968', '2020', 'PRINCIPAL');
INSERT INTO autor(autor_id, nombre, apellido, fecha_nacimiento, fecha_fallecimiento, tipo) VALUES (4, 'ANA', 'SALGADO', '1972', '', 'COAUTOR');
INSERT INTO autor(autor_id, nombre, apellido, fecha_nacimiento, fecha_fallecimiento, tipo) VALUES (1, 'ANDRÉS', 'ULLOA', '1982', '', 'PRINCIPAL');
INSERT INTO autor(autor_id, nombre, apellido, fecha_nacimiento, fecha_fallecimiento, tipo) VALUES (2, 'SERGIO', 'MARDONES', '1950', '2012', 'PRINCIPAL');
INSERT INTO autor(autor_id, nombre, apellido, fecha_nacimiento, fecha_fallecimiento, tipo) VALUES (5, 'MARTIN', 'PORTA', '1976', '', 'PRINCIPAL');


autor_id | nombre | apellido | fecha_nacimiento | fecha_fallecimiento |   tipo    
----------+--------+----------+------------------+---------------------+-----------
        3 | JOSE   | SALGADO  | 1968             | 2020                | PRINCIPAL
        4 | ANA    | SALGADO  | 1972             |                     | COAUTOR
        1 | ANDRÉS | ULLOA    | 1982             |                     | PRINCIPAL
        2 | SERGIO | MARDONES | 1950             | 2012                | PRINCIPAL
        5 | MARTIN | PORTA    | 1976             |                     | PRINCIPAL


-----------------------------------------------------------------------------------------------------------------------

Tabla libros

INSERT INTO libros (isbn, titulo, paginas, autor_id, coautor_id) VALUES ('111-1111111-111', 'CUENTOS DE TERROR', 344, 3, 4);
INSERT INTO libros (isbn, titulo, paginas, autor_id, coautor_id) VALUES ('222-2222222-222', 'POESÍAS CONTEMPORANEAS', 167, 1, null);
INSERT INTO libros (isbn, titulo, paginas, autor_id, coautor_id) VALUES ('333-3333333-333', 'HISTORIA DE ASIA', 511, 2, null);
INSERT INTO libros (isbn, titulo, paginas, autor_id, coautor_id) VALUES ('444-4444444-444', 'MANUAL DE MECÁNICA', 298, 5, null);

     isbn       |         titulo         | paginas | autor_id | coautor_id 
-----------------+------------------------+---------+----------+------------
 111-1111111-111 | CUENTOS DE TERROR      |     344 |        3 |          4
 222-2222222-222 | POESÍAS CONTEMPORANEAS |     167 |        1 |           
 333-3333333-333 | HISTORIA DE ASIA       |     511 |        2 |           
 444-4444444-444 | MANUAL DE MECÁNICA     |     298 |        5 |           
(4 rows)

---------------------------------------------------------------------------------------------------------------

Tabla prestamos

INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (1, '111-1111111-111', '20-01-2020', '27-01-2020');
INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (4, '222-2222222-222', '20-01-2020', '30-01-2020');
INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (5, '333-3333333-333', '22-01-2020', '30-01-2020');
INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (3, '444-4444444-444', '23-01-2020', '30-01-2020');
INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (2, '111-1111111-111', '27-01-2020 ', '04-02-2020');
INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (1, '444-4444444-444', '31-01-2020 ', '12-02-2020');
INSERT INTO prestamos(socio_id, isbn, fecha_prestamo, fecha_entrega) VALUES (5, '222-2222222-222', '31-01-2020 ', '12-02-2020');


prestamo_id |      isbn       | socio_id | fecha_inicio | fecha_prestamo | fecha_entrega 
-------------+-----------------+----------+--------------+----------------+---------------
           1 | 111-1111111-111 |        1 |              | 20-01-2020     | 27-01-2020
           2 | 222-2222222-222 |        4 |              | 20-01-2020     | 30-01-2020
           3 | 333-3333333-333 |        5 |              | 22-01-2020     | 30-01-2020
           4 | 444-4444444-444 |        3 |              | 23-01-2020     | 30-01-2020
           5 | 111-1111111-111 |        2 |              | 27-01-2020     | 04-02-2020
           6 | 444-4444444-444 |        1 |              | 31-01-2020     | 12-02-2020
           7 | 222-2222222-222 |        5 |              | 31-01-2020     | 12-02-2020
(7 rows)

------------------------------------------------------------------------

Ejercicio 3:
a) Mostrar todos los libros que posean menos de 300 páginas. 

biblioteca=# SELECT * FROM libros WHERE paginas < 300;

      isbn       |         titulo         | paginas | autor_id | coautor_id 
-----------------+------------------------+---------+----------+------------
 222-2222222-222 | POESÍAS CONTEMPORANEAS |     167 |        1 |           
 444-4444444-444 | MANUAL DE MECÁNICA     |     298 |        5 |           
(2 rows)

-----------------------------------------------------------------------------------------
b) Mostrar todos los autores que hayan nacido después del 01-01-1970.

biblioteca=# SELECT * FROM autor WHERE to_date(fecha_nacimiento, 'yyyy') < '01-01-1970'::date;
 autor_id | nombre | apellido | fecha_nacimiento | fecha_fallecimiento |   tipo    
----------+--------+----------+------------------+---------------------+-----------
        3 | JOSE   | SALGADO  | 1968             | 2020                | PRINCIPAL
        2 | SERGIO | MARDONES | 1950             | 2012                | PRINCIPAL
(2 rows)

----------------------------------------------------------------------------------------------------
c)¿Cuál es el libro más solicitado?

biblioteca=# SELECT isbn, COUNT(*) FROM prestamos GROUP BY isbn;
      isbn       | count 
-----------------+-------
 444-4444444-444 |     2
 111-1111111-111 |     2
 222-2222222-222 |     2
 333-3333333-333 |     1
(4 rows)

-----------------------------------------------------------------------------------------------------
d)Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.

biblioteca=# SELECT socio_id, (fecha_entrega::date - fecha_prestamo::date) * 100 AS deuda FROM prestamos;
 socio_id | deuda 
----------+-------
        1 |   700
        4 |  1000
        5 |   800
        3 |   700
        2 |   800
        1 |  1200
        5 |  1200
(7 rows)