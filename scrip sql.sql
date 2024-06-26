-- CREATE SCHEMA
CREATE SCHEMA alkawallet;

USE alkawallet;

-- creacion BD tabla usuario
CREATE TABLE usuario (
  user_id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NULL,
  correo_electronico VARCHAR(100) NULL,
  contrasenia VARCHAR(45) NULL,
  saldo INT NULL,
  PRIMARY KEY (user_id));
  
-- creacion Moneda
CREATE TABLE moneda (
 currency_id INT NOT NULL AUTO_INCREMENT,
 currency_name VARCHAR(100) NULL,
 currency_symbol VARCHAR(3) NULL,
 PRIMARY KEY (currency_id));
  
-- creacion BD Transaccion
CREATE TABLE transaccion (
  transaction_id INT NOT NULL AUTO_INCREMENT,
  sender_user_id INT NULL,
  receiver_user_id INT NULL,
  transaction_date DATE NULL,
  origin_currency_id INT NULL,
  PRIMARY KEY (transaction_id),
  INDEX user_sender_idx (sender_user_id ASC) VISIBLE,
  INDEX user_receiver_idx (receiver_user_id ASC) VISIBLE,
  INDEX origen_currency_idx (origin_currency_id ASC) VISIBLE,
    FOREIGN KEY (sender_user_id)
    REFERENCES usuario (user_id),
    FOREIGN KEY (receiver_user_id)
    REFERENCES usuario (user_id),
    FOREIGN KEY (origin_currency_id)
    REFERENCES moneda (currency_id));
	
-- poblacion de tablas usuario
INSERT INTO usuario (nombre, correo_electronico, contrasenia, saldo) 
VALUES ('sofia', 'sofia@gmail.com', '123', '500'),
('andres', 'andres@gmail.com', '123', '200'),
('pedro', 'pedro@gmail.com', '123', '100'),
('ines', 'ines@gmail.com', '123', '50'),
('olga', 'olga@gmail.com', '123', '304'),
('noelia', 'noelia@gmail.com', '123', '284'),
('miguel', 'miguel@gmail.com', '123', '29'),
('paz', 'paz@gmail.com', '123', '39'),
('ruben', 'ruben@gmail.com', '123', '70'),
( 'ester', 'ester@gmail.com', '123', '29');

-- poblacion moneda		
INSERT INTO moneda (currency_name, currency_symbol) 
VALUES ('peso chileno', '$'),
('euro', '€'),
('dolar americano', '$'),
('libra esterlina', '£'),
('dolar australiano', 'AUD'),
('dolar canadiense', 'CAD'),
('corona sueca', 'SEK'),
('peso mexicano', 'MXN'),
('real brasileño', 'BRL'),
( 'corona noruega', 'NOK');

-- poblacion transacciones
INSERT INTO transaccion (sender_user_id, receiver_user_id, transaction_date, origin_currency_id) 
VALUES ('1', '2', '2024-03-01', '1'),
('3', '1', '2024-03-15', '1'),
('1', '2', '2024-03-18', '1'),
('2', '3', '2024-03-18', '2'),
('3', '1', '2024-03-20', '2'),
('1', '2', '2024-03-20', '3'),
('2', '3', '2024-03-25', '4'),
('3', '1', '2024-03-26', '5'),
('1', '2', '2024-03-29', '10'),
( '2', '3', '2024-03-30', '6');

-- Verificacion de tablas y datos creados
-- SELECT * FROM usuario
-- SELECT * FROM moneda
-- SELECT * FROM transaccion

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
-- Respuesta con selec anidado
select currency_name from moneda 
where currency_id in (select origin_currency_id from transaccion where sender_user_id = 1);

--Respuesta con Join 
SELECT 
    mo.currency_name
FROM
    moneda mo
        JOIN
    transaccion tra ON tra.origin_currency_id = mo.currency_id
        JOIN
    usuario usu ON usu.user_id = tra.sender_user_id
WHERE
    usu.user_id = 1;
	
-- Consulta para obtener todas las transacciones registradas
SELECT * FROM transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
select * from transaccion where sender_user_id = 1;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
-- Verificar datos antes del cambio SELECT correo_electronico FROM usuario where user_id = 1;
update usuario set correo_electronico = 'sofia@yahoo.com' where user_id = 1;
--Verificacion del cambio correo electronico SELECT correo_electronico FROM usuario where user_id = 1;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
-- Verificar datos antes del cambio SELECT * FROM transaccion where transaction_id = 4;
delete from transaccion where transaction_id = 4
-- Verificar datos despues del eliminacion SELECT * FROM transaccion where transaction_id = 4;