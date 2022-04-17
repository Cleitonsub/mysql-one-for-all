DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.planos(
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano VARCHAR(15) NOT NULL,
  valor_plano DECIMAL(3, 2) NOT NULL,
  PRIMARY KEY (`plano_id`)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(50) NOT NULL,
  idade TINYINT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
  PRIMARY KEY (`usuario_id`),
  FOREIGN KEY (`plano_id`) REFERENCES `SpotifyClone`.`planos` (`plano_id`)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.artistas(
	artista_id INT NOT NULL AUTO_INCREMENT,
  artista VARCHAR(50) NOT NULL,
  PRIMARY KEY (`artista_id`)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.albuns(
	album_id INT NOT NULL AUTO_INCREMENT,
  artista_id INT NOT NULL,
  album VARCHAR(50) NOT NULL,
  ano_lancamento VARCHAR(50) NOT NULL,
  PRIMARY KEY (`album_id`),
  FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.cancoes(
	cancao_id INT NOT NULL AUTO_INCREMENT,
  album_id INT NOT NULL,
  cancao VARCHAR(50) NOT NULL,
  duracao_seg VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cancao_id`),
  FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`albuns` (`album_id`)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_reps`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.historico_reps(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  data_rep DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (`usuario_id`, `cancao_id`),
	FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`),
  FOREIGN KEY (`cancao_id`) REFERENCES `SpotifyClone`.`cancoes` (`cancao_id`)
) engine = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguindo_artista`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.seguindo_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (`usuario_id`, `artista_id`),
	FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`),
  FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano, valor_plano)
VALUES
('gratuito', '0.00'),
('familiar', '7.99'),
('universitário', '5.99'),
('pessoal', '6.99');
INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id, data_assinatura)
VALUES
('Thati', '23', 1, '2019-10-20'),
('Cintia', '35', 2, '2017-12-30'),
('Bill', '20', 3, '2019-06-05'),
('Roger', '45', 4, '2020-05-13'),
('Norman', '58', 4, '2017-02-17'),
('Patrick', '33', 2, '2017-01-06'),
('Vivian', '26', 3, '2018-01-05'),
('Carol', '19', 3, '2018-02-14'),
('Angelina', '42', 2, '2018-04-29'),
('Paul', '46', 2, '2017-01-17');
INSERT INTO SpotifyClone.artistas (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');
INSERT INTO SpotifyClone.albuns (artista_id, album, ano_lancamento)
VALUE
(1, 'Envious', '1990'),
(1, 'Exuberant', '1993'),
(2, 'Hallowed Steam', '1995'),
(3, 'Incandescent', '1998'),
(4, 'Temporary Culture', '2001'),
(4, 'Library of liberty', '2003'),
(5, 'Chained Down', '2007'),
(5, 'Cabinet of fools', '2012'),
(5, 'No guarantees', '2015'),
(6, 'Apparatus', '2015');
INSERT INTO SpotifyClone.cancoes (album_id, cancao, duracao_seg)
VALUES
(1, 'Souls For Us', 200),
(1, 'Reflections Of Magic', 163),
(1, 'Dance With Her Own', 116),
(2, 'Troubles Of My Inner Fire', 203),
(2, 'Time Fireworks', 152),
(3, 'Magic Circus', 105),
(3, 'Honey, So Do I', 207),
(3, "Sweetie, Let's Go Wild", 139),
(3, 'She Knows', 244),
(4, 'Fantasy For Me', 100),
(4, 'Celebration Of More', 146),
(4, 'Rock His Everything', 223),
(4, 'Home Forever', 231),
(4, 'Diamond Power', 241),
(4, "Let's Be Silly", 132),
(5, 'Thang Of Thunder', 240),
(5, 'Words Of Her Life', 185),
(5, 'Without My Streets', 176),
(6, 'Need Of The Evening', 190),
(6, 'History Of My Roses', 222),
(6, 'Without My Love', 111),
(6, 'Walking And Game', 123),
(6, 'Young And Father', 197),
(7, 'Finding My Traditions', 179),
(7, 'Walking And Man', 229),
(7, 'Hard And Time', 135),
(7, "Honey, I'm A Lone Wolf", 150),
(8, "She Thinks I Won't Stay Tonight", 166),
(8, "He Heard You're Bad For Me", 154),
(8, "He Hopes We Can't Stay", 210),
(8, 'I Know I Know', 117),
(9, "He's Walking Away", 159),
(9, "He's Trouble", 138),
(9, 'I Heard I Want To Bo Alone', 120),
(9, 'I Ride Alone', 151),
(10, 'Honey', 79),
(10, 'You Cheated On Me', 95),
(10, "Wouldn't It Be Nice", 213),
(10, 'Baby', 136),
(10, 'You Make Me Feel So..', 83);
INSERT INTO SpotifyClone.historico_reps (usuario_id, cancao_id, data_rep)
VALUES
(1, 36, '2020-02-28 10:45:55'),
(1, 25, '2020-05-02 05:30:35'),
(1, 23, '2020-03-06 11:22:33'),
(1, 14, '2020-08-05 08:05:17'),
(1, 15, '2020-09-14 16:32:22'),
(2, 34, '2020-01-02 07:40:33'),
(2, 24, '2020-05-16 06:16:22'),
(2, 21, '2020-10-09 12:27:48'),
(2, 39, '2020-09-21 13:14:46'),
(3, 6, '2020-11-13 16:55:13'),
(3, 3, '2020-12-05 18:38:30'),
(3, 26, '2020-07-30 10:00:00'),
(4, 2, '2021-08-15 17:10:10'),
(4, 35, '2021-07-10 15:20:30'),
(4, 27, '2021-01-09 01:44:33'),
(5, 7, '2020-07-03 19:33:28'),
(5, 12, '2017-02-24 21:14:22'),
(5, 14, '2020-08-06 15:23:43'),
(5, 1, '2020-11-10 13:52:27'),
(6, 38, '2019-02-07 20:33:48'),
(6, 29, '2017-01-24 00:31:17'),
(6, 30, '2017-10-12 12:35:20'),
(6, 22, '2018-05-29 14:56:41'),
(7, 5, '2018-05-09 22:30:49'),
(7, 4, '2020-07-27 12:52:58'),
(7, 11, '2018-01-16 18:40:43'),
(8, 39, '2018-03-21 16:56:40'),
(8, 40, '2020-10-18 13:38:05'),
(8, 32, '2019-05-25 08:14:03'),
(8, 33, '2021-08-15 21:37:09'),
(9, 16, '2021-05-24 17:23:45'),
(9, 17, '2018-12-07 22:48:52'),
(9, 8, '2021-03-14 06:14:26'),
(9, 9, '2020-04-01 03:36:00'),
(10, 20, '2017-02-06 08:21:34'),
(10, 21, '2017-12-04 05:33:43'),
(10, 12, '2017-07-27 05:24:49'),
(10, 13, '2017-12-25 01:03:57');
INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
VALUES
('1', '1'),
('1', '4'),
('1', '3'),
('2', '1'),
('2', '3'),
('3', '2'),
('3', '1'),
('4', '4'),
('5', '5'),
('5', '6'),
('6', '6'),
('6', '3'),
('6', '1'),
('7', '2'),
('7', '5'),
('8', '1'),
('8', '5'),
('9', '6'),
('9', '4'),
('9', '3'),
('10', '2'),
('10', '6');