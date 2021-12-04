CREATE TABLE crudmodelo.usuarios (
	id INT auto_increment NOT NULL,
	nome varchar(60) NOT NULL,
	email varchar(255) NOT NULL,
	senha varchar(255) NOT NULL,
	ativo INT NOT NULL,
	CONSTRAINT usuarios_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;
