-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.13 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             8.0.0.4530
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para banco
CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `banco`;


-- Volcando estructura para tabla banco.cuentabancaria
CREATE TABLE IF NOT EXISTS `cuentabancaria` (
  `idCuenta` int(11) NOT NULL,
  `sucursalBancaria` varchar(50) NOT NULL,
  `numeroCuenta` int(11) NOT NULL,
  `dc` int(11) NOT NULL,
  `saldo` decimal(10,0) NOT NULL,
  `cif` varchar(50) NOT NULL,
  PRIMARY KEY (`idCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.cuentabancaria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentabancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentabancaria` ENABLE KEYS */;


-- Volcando estructura para tabla banco.entidadbancaria
CREATE TABLE IF NOT EXISTS `entidadbancaria` (
  `idEntidad` int(11) NOT NULL,
  `codigoEntidad` varchar(50) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cif` varchar(45) NOT NULL,
  `tipoEntidadBancaria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.entidadbancaria: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `entidadbancaria` DISABLE KEYS */;
INSERT INTO `entidadbancaria` (`idEntidad`, `codigoEntidad`, `nombre`, `cif`, `tipoEntidadBancaria`) VALUES
	(3, '65', 'TorrentAvenida', 'B141221', 'BANCO'),
	(4, '53', 'Valencia-Malilla', 'B522354', 'CAJADEAHORROS'),
	(47, '65', 'OVIEDO', 'B738329', 'BANCO'),
	(5, '55', 'ZARAGOZA', 'B644215', 'BANCO'),
	(2, '66', 'Pilares', 'B554661', 'BANCO'),
	(80, '205', 'LA FONTETA', 'B361562', 'EFINANCIEROS'),
	(422, '245', 'PERZ', 'B4354323', 'BANCO'),
	(33, '665', 'Banco de Bilbao', 'B253634', 'EFINANCIEROS');
/*!40000 ALTER TABLE `entidadbancaria` ENABLE KEYS */;


-- Volcando estructura para tabla banco.movimientobancario
CREATE TABLE IF NOT EXISTS `movimientobancario` (
  `idMovimientoBancario` int(11) NOT NULL,
  `tipoMovimientoBancario` varchar(50) NOT NULL,
  `importe` decimal(10,0) NOT NULL,
  `fecha` datetime NOT NULL,
  `saldoTotal` decimal(10,0) NOT NULL,
  `concepto` varchar(50) NOT NULL,
  PRIMARY KEY (`idMovimientoBancario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.movimientobancario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientobancario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientobancario` ENABLE KEYS */;


-- Volcando estructura para tabla banco.sucursalbancaria
CREATE TABLE IF NOT EXISTS `sucursalbancaria` (
  `idSucursalBancaria` int(11) NOT NULL,
  `entidadBancaria` varchar(50) NOT NULL,
  `codigoSucursal` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idSucursalBancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.sucursalbancaria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursalbancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursalbancaria` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
