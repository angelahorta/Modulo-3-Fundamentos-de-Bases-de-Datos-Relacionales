// creacion BD tabla usuario

CREATE TABLE alkewallet.usuario (
  user_id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NULL,
  correo_electronico VARCHAR(100) NULL,
  contraseña VARCHAR(45) NULL,
  saldo INT NULL,
  PRIMARY KEY ( user_id));
  
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
    REFERENCES alkewallet.usuario ( user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT user_receiver
    FOREIGN KEY (receiver_user_id)
    REFERENCES alkewallet.usuario ( user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	// creacion Moneda
	CREATE TABLE alkewallet.moneda (
  currency_id INT NOT NULL AUTO_INCREMENT,
  currency_name VARCHAR(100) NULL,
  currency_symbol VARCHAR(3) NULL,
  PRIMARY KEY (currency_id));
  
  
