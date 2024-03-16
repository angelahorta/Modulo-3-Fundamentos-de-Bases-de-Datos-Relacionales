// creacion BD tabla usuario
CREATE TABLE alkewallet.usuario (
  user_id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NULL,
  correo_electronico VARCHAR(100) NULL,
  contraseña VARCHAR(45) NULL,
  saldo INT NULL,
  PRIMARY KEY (user_id));
  
// creacion BD Transaccion
  CREATE TABLE alkewallet.transaccion (
  transaction_id INT NOT NULL AUTO_INCREMENT,
  sender_user_id INT NULL,
  receiver_user_id INT NULL,
  transaction_date DATE NULL,
  PRIMARY KEY (transaction_id),
  INDEX user_sender_idx (sender_user_id ASC) VISIBLE,
  INDEX user_receiver_idx (receiver_user_id ASC) VISIBLE,
  CONSTRAINT user_sender
    FOREIGN KEY (sender_user_id)
    REFERENCES alkewallet.usuario (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT user_receiver
    FOREIGN KEY (receiver_user_id)
    REFERENCES alkewallet.usuario (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
// creacion Moneda
	CREATE TABLE alkewallet.moneda (
	currency_id INT NOT NULL AUTO_INCREMENT,
	currency_name VARCHAR(100) NULL,
	currency_symbol VARCHAR(3) NULL,
	PRIMARY KEY (currency_id));
  
  
// poblacion de tablas usuario
INSERT INTO usuario (nombre, correo_electronico, contraseña, saldo) VALUES ('sofia', 'sofia@gmail.com', '123', '500');
INSERT INTO usuario (nombre, correo_electronico, contraseña, saldo) VALUES ('andres', 'andres@gmail.com', '123', '200');
INSERT INTO usuario (nombre, correo_electronico, contraseña, saldo) VALUES ('pedro', 'pedro@gmail.com', '123', '100');
INSERT INTO usuario (nombre, correo_electronico, contraseña, saldo) VALUES ('ines', 'ines@gmail.com', '123', '50');

// poblacion transacciones
INSERT INTO transaccion (sender_user_id, receiver_user_id, transaction_date) VALUES ('1', '2', '2024-03-01');
INSERT INTO transaccion (sender_user_id, receiver_user_id, transaction_date) VALUES ('3', '1', '2024-03-15');
INSERT INTO transaccion (sender_user_id, receiver_user_id, transaction_date) VALUES ('4', '1', '2024-03-18');
INSERT INTO transaccion (sender_user_id, receiver_user_id, transaction_date) VALUES ('3', '2', '2024-03-20');

// poblacion moneda		
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('peso chileno', '$');
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('euro', '€');
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('dolar americano', '$');
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('libra esterlina', '£');

// Consulta para obtener el nombre de la moneda elegida por un usuario específico
select currency_name from moneda where currency_id =4;

//Consulta para obtener todas las transacciones registradas
SELECT * FROM transaccion;

//Consulta para obtener todas las transacciones realizadas por un usuario específico
select * from transaccion where sender_user_id = 1;

//Sentencia DML para modificar el campo correo electrónico de un usuario específico
update usuario set correo_electronico = 'sofia@yahoo.com' where user_id = '1';

//Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
delete from transaccion where transaction_id = 4



