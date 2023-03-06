DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano 
(
    plano_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plano	VARCHAR(512) NOT NULL,
    valor_plano	DECIMAL(10, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuario 
(
    pessoa_usuaria_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_pessoa_usuaria	VARCHAR(512) NOT NULL,
    idade	INT NOT NULL,
    plano_id	INT NOT NULL,
    data_assinatura	VARCHAR(512) NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine = InnoDB;

CREATE TABLE artistas
(
    artista_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artista	VARCHAR(512) NOT NULL
 ) engine = InnoDB;

CREATE TABLE album 
(
    album_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album	VARCHAR(512) NOT NULL,
    artista_id	INT NOT NULL,
    ano_lancamento	YEAR NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes 
(
    cancao_id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cancoes	VARCHAR(512) NOT NULL,
    duracao_segundos	INT NOT NULL,
    album_id	INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id)
) engine = InnoDB;

CREATE TABLE seguindo 
(
    pessoa_usuaria_id	INT NOT NULL,
    artista_id	INT NOT NULL,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES usuario(pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    CONSTRAINT PRIMARY KEY (pessoa_usuaria_id, artista_id)
) engine = InnoDB;

CREATE TABLE reproducao 
(
    cancao_id	INT NOT NULL,
    pessoa_usuaria_id	INT NOT NULL,
    data_reproducao	VARCHAR(512) NOT NULL,
    horario_reproducao	VARCHAR(512) NOT NULL,
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES usuario(pessoa_usuaria_id),
    CONSTRAINT PRIMARY KEY (cancao_id, pessoa_usuaria_id)
) engine = InnoDB;

INSERT INTO plano (plano_id, plano, valor_plano) VALUES
	('1', 'gratuito', '0'),
	('2', 'familiar', '7.99'),
	('3', 'universitário', '5.99'),
	('4', 'pessoal', '6.99');

INSERT INTO usuario (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES
	('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
	('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
	('3', 'Ada Lovelace', '37', '2', '2017-12-30'),
	('4', 'Martin Fowler', '46', '2', '2017-01-17'),
	('5', 'Sandi Metz', '58', '2', '2018-04-29'),
	('6', 'Paulo Freire', '19', '3', '2018-02-14'),
	('7', 'Bell Hooks', '26', '3', '2018-01-05'),
	('8', 'Christopher Alexander', '85', '4', '2019-06-05'),
	('9', 'Judith Butler', '45', '4', '2020-05-13'),
	('10', 'Jorge Amado', '58', '4', '2017-02-17');

INSERT INTO artistas (artista_id, artista) VALUES
	('1', 'Beyoncé'),
	('2', 'Queen'),
	('3', 'Elis Regina'),
	('4', 'Baco Exu do Blues'),
	('5', 'Blind Guardian'),
	('6', 'Nina Simone');

INSERT INTO album (album_id, album, artista_id, ano_lancamento) VALUES
	('1', 'Renaissance', '1', '2022'),
	('2', 'Jazz', '2', '1978'),
	('3', 'Hot Space', '2', '1982'),
	('4', 'Falso Brilhante', '3', '1998'),
	('5', 'Vento de Maio', '3', '2001'),
	('6', 'QVVJFA?', '4', '2003'),
	('7', 'Somewhere Far Beyond', '5', '2007'),
	('8', 'I Put A Spell On You', '6', '2012');

INSERT INTO cancoes (cancao_id, cancoes, duracao_segundos, album_id) VALUES
	('1', 'BREAK MY SOUL', '279', '1'),
	('2', "VIRGO'S GROOVE", '369', '1'),
	('3', 'ALIEN SUPERSTAR', '116', '1'),
	('4', "Don't Stop Me Now", '203', '2'),
	('5', 'Under Pressure', '152', '2'),
	('6', 'Como Nossos Pais', '105', '3'),
	('7', 'O Medo de Amar é o Medo de Ser Livre', '207', '4'),
	('8', 'Samba em Paris', '267', '5'),
	('9', "The Bard's Song", '244', '6'),
	('10', 'Feeling Good', '100', '7');

INSERT INTO seguindo (pessoa_usuaria_id, artista_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');

INSERT INTO reproducao (cancao_id, pessoa_usuaria_id, data_reproducao, horario_reproducao) VALUES
	('1', '6', '2017-10-12', '12:35:20'),
	('2', '1', '2020-05-02', '05:30:35'),
	('2', '3', '2020-12-05', '18:38:30'),
	('3', '10', '2015-12-13', '08:30:22'),
	('4', '7', '2011-12-15', '22:30:49'),
	('4', '8', '2012-03-17', '14:56:41'),
	('5', '5', '2020-08-06', '15:23:43'),
	('7', '2', '2020-01-02', '07:40:33'),
	('7', '6', '2017-01-24', '00:31:17'),
	('8', '1', '2022-02-28', '10:45:55'),
	('8', '4', '2021-08-15', '17:10:10'),
	('8', '5', '2022-01-09', '01:44:33'),
	('9', '9', '2022-02-24', '21:14:22'),
	('10', '1', '2020-03-06', '11:22:33'),
	('10', '2', '2022-08-05', '08:05:17'),
	('10', '3', '2020-11-13', '16:55:13');