create database Proyecto;
USE Proyecto;

CREATE TABLE usuario (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL
);
CREATE TABLE ubicacion (
    id_ubicacion INT UNSIGNED NOT NULL PRIMARY KEY,
    longitud FLOAT NOT NULL,
    latitud FLOAT NOT NULL
);
CREATE TABLE camioneros (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);
CREATE TABLE personalAlmacen (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);
CREATE TABLE oficinistas (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE clientes (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE usuario_tel (
    ci INT UNSIGNED NOT NULL,
    tel INT(9) NOT NULL,
    PRIMARY KEY (ci, tel),
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE camion (
    id_camion INT UNSIGNED NOT NULL PRIMARY KEY,
    peso FLOAT NOT NULL
);
CREATE TABLE anden (
    id_anden INT UNSIGNED NOT NULL PRIMARY KEY,
    numero_anden INT NOT NULL
);

CREATE TABLE almacen (
    id_almacen INT UNSIGNED NOT NULL PRIMARY KEY,
    latitud FLOAT NOT NULL,
    longitud FLOAT NOT NULL,
    id_anden INT UNSIGNED,
    FOREIGN KEY (id_anden) REFERENCES anden(id_anden)
);

CREATE TABLE paquete (
    id_paquete INT NOT NULL PRIMARY KEY,
    peso FLOAT NOT NULL
);

CREATE TABLE lugarEnvio (
    id_lugarEnvio INT NOT NULL PRIMARY KEY,
    longitud FLOAT NOT NULL,
    latitud FLOAT NOT NULL
);

CREATE TABLE almacena (
    id_almacen INT UNSIGNED NOT NULL,
    id_paquete INT NOT NULL,
    PRIMARY KEY (id_paquete),
    FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
    FOREIGN KEY (id_paquete) REFERENCES paquete(id_paquete)
);

create table estado (
id_estado INT UNSIGNED NOT NULL PRIMARY KEY,
nombre varchar (10)
);

CREATE TABLE pedido (
    id_pedido INT UNSIGNED NOT NULL PRIMARY KEY,
    id_lugarenvio INT NOT NULL,
    id_estado int not null,
    fechapedido DATE,
    horapedido DATETIME,
    FOREIGN KEY (id_lugarenvio) REFERENCES lugarEnvio(id_lugarEnvio)
);


CREATE TABLE pedido_almacen (
    id_paquete INT NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_paquete),
    FOREIGN KEY (id_paquete) REFERENCES almacena(id_paquete),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE Cliente_Pedido (
    id_pedido INT UNSIGNED NOT NULL,
    ci INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido, ci),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE Camioneros_Camion (
    ci INT UNSIGNED NOT NULL,
    id_camion INT UNSIGNED NOT NULL,
    PRIMARY KEY (ci),
    FOREIGN KEY (ci) REFERENCES camioneros(ci),
    FOREIGN KEY (id_camion) REFERENCES camion(id_camion)
);

CREATE TABLE pedido_cliente (
    id_pedido INT UNSIGNED NOT NULL,
    ci INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE camionerosPedido (
    ci INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (ci) REFERENCES camioneros(ci),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE ubicacion_camioneros (
    ci_camionero INT UNSIGNED NOT NULL,
    id_ubicacion INT UNSIGNED NOT NULL,
    primary key(ci_camionero),
    FOREIGN KEY (ci_camionero) REFERENCES camioneros(ci),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion)
);

INSERT INTO usuario (ci, nombre, apellido, correo, usuario) 
VALUES
    (15054918, 'Sofía', 'Romero', 'sofía@example.com', 'camioneros'),
    (75646029, 'Juan', 'Sánchez', 'juan@example.com', 'camioneros'),
    (90322438, 'Pedro', 'Rodríguez', 'pedro@example.com', 'camioneros'),
    (35940297, 'Juan', 'González', 'juan@example.com', 'camioneros'),
    (84848470, 'Laura', 'García', 'laura@example.com', 'camioneros'),
    (42366463, 'Ana', 'González', 'ana@example.com', 'cliente'),
    (35164449, 'Paula', 'Romero', 'paula@example.com', 'cliente'),
    (35774907, 'Sofía', 'Rodríguez', 'sofía@example.com', 'cliente'),
    (14449881, 'Laura', 'López', 'laura@example.com', 'cliente'),
    (82880761, 'Juan', 'Fernández', 'juan@example.com', 'oficinistas'),
    (12345678, 'Carlos', 'Martínez', 'carlos@example.com', 'personal_almacen'),
    (23456789, 'Luisa', 'López', 'luisa@example.com', 'personal_almacen'),
    (34567890, 'Roberto', 'Gómez', 'roberto@example.com', 'personal_almacen');


INSERT INTO camioneros (ci)
VALUES
    (15054918),
    (75646029),
    (90322438),
    (35940297),
    (84848470);

 
 INSERT INTO clientes (ci) 
VALUES
    (42366463),
    (35164449),
    (35774907),
    (14449881);

 
INSERT INTO oficinistas (ci) 
VALUES (82880761);

 INSERT INTO personalAlmacen (ci)
VALUES
    (12345678),
    (23456789),
    (34567890);
INSERT INTO usuario_tel (ci, tel) 
VALUES
    (15054918, '092060952'),
    (75646029, '096270174'),
    (90322438, '097335666'),
    (35940297, '097897654'),
    (84848470, '096122228'),
    (42366463, '098841177'),
    (35164449, '095978761'),
    (35774907, '094080914'),
    (14449881, '095528951'),
    (82880761, '099835256'),
	(12345678, '098765432'),
    (23456789, '099876543'),
    (34567890, '097654321');

 
INSERT INTO camion (id_camion, peso) VALUES (37, 181.93),
 (51, 9565.33), (83, 4063.26), (89, 2417.26), (9, 1620.62), 
 (73, 5018.10), (97, 966.21), (49, 2656.80), (3, 4299.94), 
 (77, 2699.84);
 
 INSERT INTO anden (id_anden, numero_anden) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104);
 
 INSERT INTO almacen (id_almacen, latitud, longitud, id_anden) VALUES
(54, 14.152532, -112.305083, 1),
(45, 54.084340, -131.666482, 1),
(98, 78.651926, 54.240202, 2),
(61, -3.647300, -73.871064, 2),
(38, 38.690374, 9.624890, 3),
(55, 10.375304, -100.312671, 3),
(36, 18.494121, -30.869243, 4),
(68, 63.473521, -104.016908, 4),
(39, -21.320194, -70.215187, 1),
(75, -36.211815, -176.060812, 1);
 
 INSERT INTO paquete (id_paquete, peso) 
 VALUES (1, 18.14), (2, 4.85), (3, 32.23), 
 (4, 41.10), (5, 43.08), (6, 49.19), (7, 3.22), 
 (8, 1.77), (9, 48.07), (10, 14.07);
 
INSERT INTO lugarEnvio (id_lugarEnvio, longitud, latitud) 
VALUES 
    (11, -56.1874, -34.9011), 
    (12, -56.1918, -34.9055), 
    (13, -56.1752, -34.9119), 
    (14, -56.1777, -34.9210), 
    (15, -56.1755, -34.9322), 
    (16, -56.1870, -34.9315),
    (17, -56.1652, -34.9084),
    (18, -56.1710, -34.9189), 
    (19, -56.1914, -34.9085), 
    (20, -56.1913, -34.9081);


INSERT INTO almacena (id_almacen, id_paquete) 
VALUES
    (54, 1),
    (45, 2),
    (98, 3),
    (61, 4),
    (38, 5),
    (55, 6),
    (36, 7),
    (68, 8),
    (39, 9),
    (75, 10);
INSERT INTO estado (id_estado, nombre) VALUES
    (1, 'Almacen'),
    (2, 'En Camino'),
    (3, 'Entregado');

INSERT INTO pedido (id_pedido, id_lugarenvio, id_estado, fechapedido, horaPedido) VALUES
    (11, 11, 1, '2023-09-10', '10:30:00'),
    (12, 12, 2, '2023-09-11', '11:15:00'),
    (13, 13, 3, '2023-09-12', '12:45:00'),
    (14, 14, 1, '2023-09-13', '14:00:00'),
    (15, 15, 2, '2023-09-14', '15:30:00'),
    (16, 16, 3, '2023-09-15', '16:45:00'),
    (17, 17, 1, '2023-09-16', '17:15:00'),
    (18, 18, 2, '2023-09-17', '18:30:00'),
    (19, 19, 3, '2023-09-18', '19:45:00'),
    (20, 20, 1, '2023-09-19', '20:00:00');




INSERT INTO pedido_almacen (id_paquete, id_pedido)
VALUES
    (1, 11),
    (2, 12), 
    (3, 13),
    (4, 14), 
    (5, 15), 
    (6, 16), 
    (7, 17), 
    (8, 18), 
    (9, 19), 
    (10, 20); 

INSERT INTO Cliente_Pedido (id_pedido, ci) 
VALUES
    (11, 42366463),
    (12, 35164449),
    (13, 35774907),
    (14, 14449881),
    (15, 42366463),
    (16, 35164449),
    (17, 35774907),
    (18, 42366463),
    (19, 35774907),
    (20, 14449881);
INSERT INTO Camioneros_Camion (ci, id_camion) 
VALUES 
    (15054918, 37),
    (75646029, 51),
    (90322438, 83),
    (35940297, 89),
    (84848470, 9);


INSERT INTO camionerosPedido (ci, id_pedido)
VALUES 
    (15054918, 11), 
    (75646029, 12), 
    (90322438, 13),
    (35940297, 14),
    (84848470, 15); 

INSERT INTO ubicacion (id_ubicacion, longitud, latitud)
VALUES
    (21, -56.2116, -34.9036),
    (22, -56.1814, -34.9034), 
    (23, -56.1552, -34.9010), 
    (24, -56.1602, -34.9088), 
    (25, -56.1505, -34.9151); 

INSERT INTO ubicacion_camioneros (ci_camionero, id_ubicacion)
VALUES
    (15054918, 21),  
    (75646029, 22), 
    (90322438, 23),  
    (35940297, 24),  
    (84848470, 25); 
    
SELECT u.nombre, u.apellido, u.usuario, ut.tel
FROM usuario u
JOIN usuario_tel ut ON u.ci = ut.ci
WHERE u.usuario = 'camioneros';

SELECT p.id_paquete, p.peso
FROM paquete p
JOIN almacena a ON p.id_paquete = a.id_paquete
JOIN almacen al ON a.id_almacen = al.id_almacen
WHERE al.id_almacen = 54;

SELECT p.id_pedido, p.fechapedido, p.horapedido, e.nombre AS estado
FROM pedido p
JOIN Cliente_Pedido cp ON p.id_pedido = cp.id_pedido
JOIN estado e ON p.id_estado = e.id_estado
WHERE cp.ci = 42366463;

SELECT u.nombre, u.apellido, uc.ci_camionero, u2.latitud, u2.longitud
FROM usuario u
JOIN ubicacion_camioneros uc ON u.ci = uc.ci_camionero
JOIN ubicacion u2 ON uc.id_ubicacion = u2.id_ubicacion
WHERE u.ci = 15054918;

SELECT SUM(p.peso) AS peso_total
FROM paquete p
JOIN almacena a ON p.id_paquete = a.id_paquete
JOIN almacen al ON a.id_almacen = al.id_almacen
WHERE al.id_almacen = 54;
