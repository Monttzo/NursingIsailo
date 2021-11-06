-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2021 a las 20:57:10
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--
CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `ActivarMedico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarMedico` (IN `_idMedico` VARCHAR(12), IN `_idUsuario` VARCHAR(12))  BEGIN
update proyecto.usuario set 
               Estado = 1
                where idUsuario = _idUsuario;
		update proyecto.medico set 
                Estado = 1
                where idMedico = _idMedico;
END$$

DROP PROCEDURE IF EXISTS `inactivarMedico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inactivarMedico` (IN `_idMedico` VARCHAR(12), IN `_idUsuario` VARCHAR(12))  BEGIN
update proyecto.usuario set 
               Estado = 0
                where idUsuario = _idUsuario;
		update proyecto.medico set 
                Estado = 0
                where idMedico = _idMedico;
END$$

DROP PROCEDURE IF EXISTS `insertarMedico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMedico` (IN `_idMedico` VARCHAR(12), IN `_idUsuario` VARCHAR(12), IN `_Nombre` VARCHAR(50), IN `_Apellido` VARCHAR(50), IN `_Telefono` VARCHAR(20), IN `_Correo` VARCHAR(100), IN `_Especialidad` VARCHAR(50), IN `_tarjetaProfesional` INT(11), IN `_Estado` BIT(1), IN `_Password` VARCHAR(20), IN `_Direccion` VARCHAR(50), IN `_Rol` VARCHAR(20))  BEGIN

 insert into `proyecto`.`usuario` (`idUsuario`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Direccion`, `password`, `Rol`,

 `Estado`) values (`_idUsuario`, `_Nombre`, `_Apellido`, `_Correo`, `_Telefono`, `_Direccion`, `_Password`, `_Rol`, `_Estado`);

 insert into `proyecto`.`medico` (`idMedico`, `Nombre`, `Apellido`, `Telefono`, `Correo`, `Especialidad`, `TarjetaProfesional`, `Estado`,

 `idUsuarioFK`) values (`_idMedico`, `_Nombre`, `_Apellido`, `_Telefono`, `_Correo`, `_Especialidad`, `_tarjetaProfesional`, `_Estado`, `_idUsuario`);

 END$$

DROP PROCEDURE IF EXISTS `insertarPaciente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPaciente` (IN `_idPaciente` VARCHAR(12), IN `_idUsuario` VARCHAR(12), IN `_Nombre` VARCHAR(50), IN `_Apellido` VARCHAR(50), IN `_Telefono` VARCHAR(20), IN `_Correo` VARCHAR(100), IN `_FechaNacimiento` DATE, IN `_Estado` BIT(1), IN `_Password` VARCHAR(20), IN `_Direccion` VARCHAR(50))  BEGIN

 insert into `proyecto`.`usuario` (`idUsuario`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Direccion`, `password`, `Rol`,`Estado`) 

values (`_idUsuario`, `_Nombre`, `_Apellido`, `_Correo`,`_Telefono`, `_Direccion`, `_Password`, 'Paciente', `_Estado`);

 insert into `proyecto`.`paciente` (`idPaciente`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `FechaNacimiento`, `Estado`,

 `idUsuarioFK`) values (`_idPaciente`, `_Nombre`, `_Apellido`, `_Correo`, `_Telefono`, `_FechaNacimiento`, `_Estado`, `_idUsuario`);

 END$$

DROP PROCEDURE IF EXISTS `modificarMedico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarMedico` (IN `_idMedico` VARCHAR(12), IN `_Nombre` VARCHAR(50), IN `_Apellido` VARCHAR(50), IN `_Telefono` VARCHAR(20), IN `_Correo` VARCHAR(100), IN `_Direccion` VARCHAR(50), IN `_password` VARCHAR(20), IN `_tarjetaProfesional` INT(11), IN `_idUsuario` VARCHAR(12))  BEGIN
		update proyecto.usuario set 
                Nombre =_Nombre,
                Apellido =_Apellido,
                Correo =_Correo,
                Telefono =_Telefono,
                Direccion =_Direccion,
                `password` =_password
                where idUsuario = _idUsuario;
		update proyecto.medico set 
                Nombre =_Nombre,
                Apellido =_Apellido,
                Telefono =_Telefono,
                Correo =_Correo,
                TarjetaProfesional = _tarjetaProfesional
                where idMedico = _idMedico;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `idAgenda` varchar(6) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` datetime NOT NULL,
  `Consultorio` int(11) NOT NULL,
  `Estado` bit(1) NOT NULL,
  `idMedicoFK` varchar(12) DEFAULT NULL,
  `idPacienteFK` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idAgenda`),
  UNIQUE KEY `idAgenda_UNIQUE` (`idAgenda`),
  UNIQUE KEY `idMedicoFK_UNIQUE` (`idMedicoFK`),
  UNIQUE KEY `idPacienteFK_UNIQUE` (`idPacienteFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`idAgenda`, `Fecha`, `Hora`, `Consultorio`, `Estado`, `idMedicoFK`, `idPacienteFK`) VALUES
('810101', '2020-02-13', '2020-02-13 16:30:00', 7, b'1', '12', '1'),
('810102', '2020-04-22', '2020-04-22 13:40:00', 8, b'1', '1', '2'),
('810103', '2020-03-06', '2020-03-06 08:20:00', 9, b'1', '10', '3'),
('810104', '2020-06-11', '2020-06-11 10:10:00', 10, b'1', '11', '4'),
('810105', '2020-01-30', '2020-01-30 14:05:00', 11, b'1', '7', '5'),
('810106', '2020-08-25', '2020-08-25 09:10:00', 12, b'1', '8', '6');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `agenda_medico_paciente`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `agenda_medico_paciente`;
CREATE TABLE IF NOT EXISTS `agenda_medico_paciente` (
`agenda` varchar(6)
,`apellido` varchar(50)
,`medico` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `agenda_paciente`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `agenda_paciente`;
CREATE TABLE IF NOT EXISTS `agenda_paciente` (
`Fecha` date
,`Nombre` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultamedica`
--

DROP TABLE IF EXISTS `consultamedica`;
CREATE TABLE IF NOT EXISTS `consultamedica` (
  `idConsulta` varchar(20) NOT NULL,
  `Hora` datetime NOT NULL,
  `Motivo` text NOT NULL,
  `Enfermedad` text NOT NULL,
  `idHistoriaFK` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idConsulta`),
  UNIQUE KEY `idConsulta_UNIQUE` (`idConsulta`),
  UNIQUE KEY `idHistoriaFK_UNIQUE` (`idHistoriaFK`),
  KEY `FK_idHistoria_consulta_idx` (`idHistoriaFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consultamedica`
--

INSERT INTO `consultamedica` (`idConsulta`, `Hora`, `Motivo`, `Enfermedad`, `idHistoriaFK`) VALUES
('51010101010101010101', '2020-02-13 16:32:07', 'Consulta general porque, el paciente sufre de mucho picor en la nariz(mas de lo habitual), ademas de presentar ojos llorosos, estornudos frecuentes y la caida de agüilla por la nariz', 'Rinitis', '410101'),
('51010101010101010102', '2020-04-22 13:40:58', 'Consulta general porque, sufre fuertes dolores de cabeza junto con náuseas', 'Migraña', '410102'),
('51010101010101010103', '2020-03-06 08:25:13', 'Revisión con el oculista', 'Miopia', '410103'),
('51010101010101010104', '2020-06-11 10:18:42', 'Consulta general porque, el paciente presenta dificultad para respirar junto con episodios de tos seca y opresion en el pecho', 'Asma', '410104'),
('51010101010101010105', '2020-01-30 14:06:26', 'Consulta general porque, el paciente presenta ojos llorosos, estornudos frecuentes; Y su cuerpo se encuentra a altas temperaturas ', 'Fiebre y Renitis', '410105'),
('51010101010101010106', '2020-08-25 09:10:39', 'Revisión con el oculista', 'Queratocono', '410106');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
CREATE TABLE IF NOT EXISTS `diagnostico` (
  `idDiagnostico` varchar(20) NOT NULL,
  `Descripcion` text NOT NULL,
  `idConsultaFK` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idDiagnostico`),
  UNIQUE KEY `idDiagnostico_UNIQUE` (`idDiagnostico`),
  UNIQUE KEY `idConsultaFK_UNIQUE` (`idConsultaFK`),
  KEY `idConsultaFK_idx` (`idConsultaFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`idDiagnostico`, `Descripcion`, `idConsultaFK`) VALUES
('61010101010101010101', 'El dia 13 de Febrero del año 2020 a las 16:32:07,ingresan al consultorio numero 7 dos personas(Hombres) con el motivo de asistir a una cita agendada anteriormente; la razón de la visita es porque el señor Julian Mauricio Patiño Reyes, que viene acompañado de su acudiente Carlos Arturo Patiño Guinchin, sufre de mucho picor en la nariz(mas de lo habitual), ademas de presentar ojos llorosos, estornudos frecuentes y la caida de agüilla por la nariz. Por tal motivo decidimos realizar un examen de sangre ya que intuimos, y lo mas probable, es que el paciente tenga rinitis aguda, pero realizamos el examen con el costo de $40000 para estar más seguros  ', '51010101010101010101'),
('61010101010101010102', 'El dia 22 de Abril del año 2020 a las 13:40:58, ingresa al consultorio numero 8 el señor Camilo Andres Gomez rativa con el motivo de asistir a una cita agendada previamente; la razón de la visita es porque el señor padece de fuertes dolores de cabeza junto con nauseas en los ultimos dias. Deducimos que el paciente sufre de Migraña, por este motivo decidimos realizar un examen de orina para poder verficar que es cierta nuestra afirmacioón', '51010101010101010102'),
('61010101010101010103', 'El dia 06 de Marzo del año 2020 a las 05:25:13, ingresa al consultorio numero 9 la señora Daniela Rocha Nova con el motivo de asistir a una cita agendada anteriormente; la razon de la visita es para realizarce una revisión ocular con el oftalmologo con un valor de $65000', '51010101010101010103'),
('61010101010101010104', 'El dia 11 de Junio del año 2020 a las 10:18:42, ingresa al consultorio numero 10 el señor Daniel Alexander Arias Uribe con el motivo de asistir a una cita agendada previamente; la razon de la visita es porque el paciente presenta dificultad para respirar junto con episodios de tos seca y opresión en el pecho. Por tanto le emos pedido que realice unos examenes de sangre de tan solo $40000 para ver si finalmente lo diagnosticamos con Asma ', '51010101010101010104'),
('61010101010101010105', 'El dia 30 de Enero del año 2020 a las 14:06:26, ingresa al consultorio numero 11 el señor Daniel Estevan Monsalve Pulido con el motivo de asistir a una cita agendada anteriormente; la razon de la visita es porque el paciente presenta ojos llorosos, estornudos frecuentes; Y su cuerpo se encuentra a altas temperaturas. Facilmente nos dimos cuenta que el paciente tiene Fiebre y decidimos que realice un examen de sangre para recetarle una solución', '51010101010101010105'),
('61010101010101010106', 'El dia 25 de Agosto del año 2020 a las 09:10:39,ingresa al consultorio numero 12 el señor Cristian David Osorio Alvarez con el motivo de asistir a una cita agendada previamente; la razon de la visita es para realizarce una revisión ocular con el oftalmologo con un valor de $65000', '51010101010101010106');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `diagnostico_consulta`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `diagnostico_consulta`;
CREATE TABLE IF NOT EXISTS `diagnostico_consulta` (
`descripcion` text
,`enfermedad` text
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

DROP TABLE IF EXISTS `examen`;
CREATE TABLE IF NOT EXISTS `examen` (
  `idExamen` varchar(20) NOT NULL,
  `Valor` double NOT NULL,
  `Fecha` date NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `idHistoriaFK` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idExamen`),
  UNIQUE KEY `idExamen_UNIQUE` (`idExamen`),
  UNIQUE KEY `idHistoriaFK_UNIQUE` (`idHistoriaFK`),
  KEY `idHistoriaFK_idx` (`idHistoriaFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`idExamen`, `Valor`, `Fecha`, `Tipo`, `idHistoriaFK`) VALUES
('71010101010101010101', 40000, '2020-02-20', 'Examen de sangre', '410101'),
('71010101010101010102', 50000, '2020-05-15', 'Examen de orina', '410102'),
('71010101010101010103', 65000, '2020-03-24', 'Revisión oftalmológica', '410103'),
('71010101010101010104', 40000, '2020-07-02', 'Examen de sangre', '410104'),
('71010101010101010105', 43500, '2020-02-11', 'Examen de sangre', '410105'),
('71010101010101010106', 65000, '2020-09-05', 'Revisión oftalmológica', '410106');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `examen_historiaclinica`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `examen_historiaclinica`;
CREATE TABLE IF NOT EXISTS `examen_historiaclinica` (
`tipo` varchar(50)
,`enfermedades` text
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
CREATE TABLE IF NOT EXISTS `historiaclinica` (
  `idHistoria` varchar(6) NOT NULL,
  `Estatura` double NOT NULL,
  `Peso` double NOT NULL,
  `AntecedentesFamiliares` text NOT NULL,
  `Alergias` text NOT NULL,
  `EnfermedadesPadecidas` text NOT NULL,
  `idPacienteFK` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idHistoria`),
  UNIQUE KEY `idHistoria_UNIQUE` (`idHistoria`),
  UNIQUE KEY `idPaciente_UNIQUE` (`idPacienteFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historiaclinica`
--

INSERT INTO `historiaclinica` (`idHistoria`, `Estatura`, `Peso`, `AntecedentesFamiliares`, `Alergias`, `EnfermedadesPadecidas`, `idPacienteFK`) VALUES
('410101', 1.66, 65, 'El padre sufre de miopia', 'Ninguna', 'Miopia en ambos ojos, Rinitis', '1'),
('410102', 1.66, 66, 'Ninguna', 'Ninguna', 'Migraña', '2'),
('410103', 1.62, 62, 'La madre sufre de miopia', 'Ninguna', 'Miopia en ambos ojos', '3'),
('410104', 1.71, 70, 'Sus padres de familia sufren de asma', 'Ninguna', 'Asma', '4'),
('410105', 1.61, 66, 'Ninguno', 'Ninguna', 'Miopia en ambos ojos, Rinitis', '5'),
('410106', 1.61, 63, 'El padre sufre de queratocono en el ojo derecho', 'Ninguna', 'Renitis,Queratocono en ambos ojos(heredado del padre)', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `idMedico` varchar(12) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Especialidad` varchar(50) NOT NULL,
  `TarjetaProfesional` int(11) NOT NULL,
  `Estado` bit(1) NOT NULL,
  `idUsuarioFK` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `idMedico_UNIQUE` (`idMedico`),
  UNIQUE KEY `idUsuarioFK_UNIQUE` (`idUsuarioFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`idMedico`, `Nombre`, `Apellido`, `Telefono`, `Correo`, `Especialidad`, `TarjetaProfesional`, `Estado`, `idUsuarioFK`) VALUES
('1', 'Nicol', 'Ariza Ruiz', '673434', 'Nicoru@gmail.com', 'Medico', 2147483647, b'0', '2'),
('10', 'Nicolas', 'Garcia Rincon', '5643234', 'Nicogar@gmail.com', 'Enfermero', 2147483647, b'1', '16'),
('11', 'Maria Camila', 'Certuche Betancour', '4554344', 'Camicertu@gmail.com', 'Medico', 2147483647, b'1', '17'),
('12', 'Mc Anderson', 'Jurado Realpe', '6543210', 'Mcand1234@gmail.com', 'Medico', 2147483647, b'1', '18'),
('13', 'Maria Jose', 'Leon Buesaquillo', '3521478', 'Majoleon@gmail.com', 'Medico', 2147483647, b'0', '19'),
('14', 'david', 'osorio', '654312', 'crosorio@gmail.com', 'Médico', 12231212, b'1', '21'),
('15', 'camilo', 'alvarez', '2123443', 'cam@gmail.com', 'Médico', 232445324, b'1', '22'),
('16', 'sads', 'sadasda', '123455', 'adsdas@mail.com', 'Enfermero', 1214432, b'1', '23'),
('17', 'Monzi', 'Jaramillo', '3014899831', 'MonziJa@gmail.com', 'Médico', 12342456, b'1', '24'),
('18', 'David', 'Osorio', '1232312', 'sasd@gmail.com', 'Médico', 213123131, b'1', '25'),
('19', 'dsdfs', 'dsdfs', '21231231', 'sasa@gmail.com', 'Enfermero', 231232, b'1', '26'),
('2', 'Nicol Dayana', 'Alvarez Cabezas', '6785432', 'nic19@gmail.com', 'Enfermero', 2147483647, b'0', '4'),
('20', 'daniel', 'rodriguez', '2321312', 'darodri@gmail.com', 'Médico', 12312, b'1', '27'),
('21', 'Felipe', 'Rojas', '123453', 'Fel@gmail.com', 'Enfermero', 213, b'1', '28'),
('3', 'Javier', 'Osorio Avila', '9876789', 'Josorio@gmail.com', 'Medico', 2147483647, b'1', '5'),
('4', 'Paola', 'Alvarez Cabezas', '8798064', 'Palvarez@gmail.com', 'Medico', 2147483647, b'1', '6'),
('5', 'Daniel Felipe', 'Vega Bonilla', '1432542', 'Danfelip@gmail.com', 'Enfermero', 2147483647, b'1', '11'),
('6', 'Jairo Andres', 'Fernandez Mejia', '5643469', 'Jairitofernandez@gmail.com', 'Medico', 2147483647, b'1', '12'),
('7', 'Maria Jose', 'Leon Buesaquillo', '3521478', 'Majoleon@gmail.com', 'Medico', 2147483647, b'1', '13'),
('8', 'Liliana Paola', 'Garcia Parra', '5645537', 'Lilipao@gmail.com', 'Medico', 2147483647, b'1', '14'),
('9', 'Nataly Alejandra', 'Porras Murillo', '4653324', 'Natalyporras@gmail.com', 'Enfermero', 2147483647, b'1', '15');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `new_view`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `new_view`;
CREATE TABLE IF NOT EXISTS `new_view` (
`esp` varchar(50)
,`nom` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `idPaciente` varchar(12) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Estado` bit(1) NOT NULL,
  `idUsuarioFK` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `idPaciente_UNIQUE` (`idPaciente`),
  UNIQUE KEY `idUsuarioFK_UNIQUE` (`idUsuarioFK`),
  KEY `idUsuarioFK_idx` (`idUsuarioFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idPaciente`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `FechaNacimiento`, `Estado`, `idUsuarioFK`) VALUES
('1', 'Julian Mauricio', 'Patiño Reyes', 'Cra 45 N° 6 K 56 sur', '7724363', '2000-03-12', b'1', '1'),
('2', 'Camilo Andres', 'Gomez Rativa', 'Cra 75 N° 9 G 78 sur', '8765432', '1992-01-07', b'1', '3'),
('3', 'Daniela', 'Rocha Nova', 'Cra 12 N° 4 N 98 sur', '2346543', '2002-10-15', b'1', '7'),
('4', 'Daniel Alexander', 'Arias Uribe', 'Cra 6 N° 5 B 34 sur', '4563423', '1990-05-24', b'1', '8'),
('5', 'Daniel Esteban', 'Monsalve Pulido', 'Cra 5 N° 3 Y 87 sur', '6754324', '2002-08-06', b'1', '9'),
('6', 'Cristian David', 'Osorio Alvarez', 'CLL 87 N° 2 T 54 sur', '6545673', '1997-08-18', b'1', '10'),
('7', 'Juan Pablo', 'Ramirez', 'JuanRami@gmail.com', '3114679847', '2002-05-12', b'1', '20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` varchar(12) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `Estado` bit(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Direccion`, `password`, `Rol`, `Estado`) VALUES
('1', 'Julian Mauricio', 'Patiño Reyes', 'Juli435@gmail.com', '7724363', 'Cra 45 N° 6 K 56 sur', 'JM2367451', 'Paciente', b'1'),
('10', 'Cristian David', 'Osorio Alvarez', 'Crisosorio@gmail.com', '6545673', 'CLL 87 N° 2 T 54 sur', 'Cr10265822', 'Paciente', b'1'),
('11', 'Daniel Felipe', 'Vega Bonilla', 'Danfelip@gmail.com', '1432542', 'CLL 45 N° 3 F 67 sur', 'Df2345433', 'Enfermero', b'1'),
('12', 'Jairo Andres', 'Fernandez Mejia', 'Jairitofernandez@gmail.com', '5643469', 'CLL 45 N° 8 P 23 Norte', 'Ja11245423', 'Medico', b'1'),
('13', 'Maria Jose', 'Leon Buesaquillo', 'Majoleon@gmail.com', '3521478', 'CLL 32 Nï¿½ 1 U 43 Norte', 'MJ2342312', 'Medico', b'0'),
('14', 'Liliana Paola', 'Garcia Parra', 'Lilipao@gmail.com', '5645537', 'CLL 45 N° 8 C 63 sur', 'LP81993274', 'Medico', b'1'),
('15', 'Nataly Alejandra', 'Porras Murillo', 'Natalyporras@gmail.com', '4653324', 'CLL 36 N° 4 Ñ 93 sur', 'Na632751', 'Enfermero', b'1'),
('16', 'Nicol', 'Ariza Ruiz', 'Nicoru@gmail.com', '673434', 'CLL 12 N° 8 R 33 Norte', 'Contraseña', 'Enfermero', b'0'),
('17', 'Maria Camila', 'Certuche Betancour', 'Camicertu@gmail.com', '4554344', 'Cra 3 N° 6 D 37 sur', 'MC462861', 'Medico', b'1'),
('18', 'Mc Anderson', 'Jurado Realpe', 'Mcand1234@gmail.com', '6543210', 'CLL 27 N° 3 S 45 sur', 'MA4456861', 'Medico', b'1'),
('19', 'Miguel', 'Rozo', 'MigueRozo@gmail.com', '3207584756', 'calle5m', 'MigueRozo', 'Medico', b'1'),
('2', 'Nicolas', 'Ariza Ruiz', 'Nicoru@gmail.com', '7657895', 'CLL 76 N° 4 J 23 Norte', 'NA4561823', 'Medico', b'1'),
('20', 'Juan Pablo', 'Ramirez', 'JuanRami@gmail.com', '3114679847', 'calle 6 sur', 'JuanRami', 'Paciente', b'1'),
('21', 'david', 'osorio', 'crosorio@gmail.com', '654312', 'cll 49 # 5 j 78', '1234567', 'Médico', b'1'),
('22', 'camilo', 'alvarez', 'cam@gmail.com', '2123443', 'cll 49 N 5j 47', 'Contraseña', 'Médico', b'1'),
('23', 'sads', 'sadasda', 'adsdas@mail.com', '123455', 'cll 3235', '123456', 'Enfermero', b'1'),
('24', 'Monzi', 'Jaramillo', 'MonziJa@gmail.com', '3014899831', 'calle 31 sur # 44', 'Contraseña', 'Médico', b'1'),
('25', 'David', 'Osorio', 'sasd@gmail.com', '1232312', 'cll34', '123456', 'Médico', b'1'),
('26', 'dsdfs', 'dsdfs', 'sasa@gmail.com', '21231231', 'cll 67 ', '1234567', 'Enfermero', b'1'),
('27', 'daniel', 'rodriguez', 'darodri@gmail.com', '2321312', 'Cll 65', '1234567', 'Médico', b'1'),
('28', 'Felipe', 'Rojas', 'Fel@gmail.com', '123453', 'Cll 65 ', '123456', 'Enfermero', b'1'),
('3', 'Camilo Andres', 'Gomez Rativa', 'Camandres@gmail.com', '8765432', 'Cra 75 N° 9 G 78 sur', 'CG47759221', 'Paciente', b'1'),
('4', 'Nicol Dayana', 'Alvarez Cabezas', 'nic19@gmail.com', '6785432', 'CLL 49 N° 5 J 46sur', 'ND47593975', 'Enfermero', b'0'),
('5', 'Javier', 'Osorio Avila', 'Josorio@gmail.com', '9876789', 'CLL 15 N° 3 L 67 sur', 'JO434456321', 'Medico', b'1'),
('6', 'Paola', 'Alvarez Cabezas', 'Palvarez@gmail.com', '8798064', 'Cra 23 N° 9 H 78 sur', 'Pa1553245', 'Medico', b'1'),
('7', 'Daniela', 'Rocha Nova', 'Danirocha@gmail.com', '2346543', 'Cra 12 N° 4 N 98 sur', 'Dr774268423', 'Paciente', b'1'),
('8', 'Daniel Alexander', 'Arias Uribe', 'Alexuribe@gmail.com', '4563423', 'Cra 6 N° 5 B 34 sur', 'Da67434578', 'Paciente', b'1'),
('9', 'Daniel Esteban', 'Monsalve Pulido', 'Danpulido@gmail.com', '6754324', 'Cra 5 N° 3 Y 87 sur', 'Dm9843075', 'Paciente', b'1');

-- --------------------------------------------------------

--
-- Estructura para la vista `agenda_medico_paciente`
--
DROP TABLE IF EXISTS `agenda_medico_paciente`;

DROP VIEW IF EXISTS `agenda_medico_paciente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agenda_medico_paciente`  AS  select `agenda`.`idAgenda` AS `agenda`,`paciente`.`Apellido` AS `apellido`,`medico`.`Nombre` AS `medico` from ((`agenda` join `paciente` on(`paciente`.`idPaciente` = `agenda`.`idPacienteFK`)) join `medico` on(`medico`.`idMedico` = `agenda`.`idMedicoFK`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `agenda_paciente`
--
DROP TABLE IF EXISTS `agenda_paciente`;

DROP VIEW IF EXISTS `agenda_paciente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agenda_paciente`  AS  select `agenda`.`Fecha` AS `Fecha`,`paciente`.`Nombre` AS `Nombre` from (`agenda` join `paciente` on(`paciente`.`idPaciente` = `agenda`.`idPacienteFK`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `diagnostico_consulta`
--
DROP TABLE IF EXISTS `diagnostico_consulta`;

DROP VIEW IF EXISTS `diagnostico_consulta`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `diagnostico_consulta`  AS  select `diagnostico`.`Descripcion` AS `descripcion`,`consultamedica`.`Enfermedad` AS `enfermedad` from (`diagnostico` join `consultamedica` on(`consultamedica`.`idConsulta` = `diagnostico`.`idConsultaFK`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `examen_historiaclinica`
--
DROP TABLE IF EXISTS `examen_historiaclinica`;

DROP VIEW IF EXISTS `examen_historiaclinica`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `examen_historiaclinica`  AS  select `examen`.`Tipo` AS `tipo`,`historiaclinica`.`EnfermedadesPadecidas` AS `enfermedades` from (`examen` join `historiaclinica` on(`historiaclinica`.`idHistoria` = `examen`.`idHistoriaFK`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `new_view`
--
DROP TABLE IF EXISTS `new_view`;

DROP VIEW IF EXISTS `new_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `new_view`  AS  select `medico`.`Especialidad` AS `esp`,`usuario`.`Nombre` AS `nom` from (`medico` join `usuario` on(`usuario`.`idUsuario` = `medico`.`idUsuarioFK`)) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `FK_idMedico_agenda` FOREIGN KEY (`idMedicoFK`) REFERENCES `medico` (`idMedico`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_idPaciente_agenda` FOREIGN KEY (`idPacienteFK`) REFERENCES `paciente` (`idPaciente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `consultamedica`
--
ALTER TABLE `consultamedica`
  ADD CONSTRAINT `FK_idHistoria_consulta` FOREIGN KEY (`idHistoriaFK`) REFERENCES `historiaclinica` (`idHistoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `FK_idConsulta_diagnostico` FOREIGN KEY (`idConsultaFK`) REFERENCES `consultamedica` (`idConsulta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `FK_idHistoria_examen` FOREIGN KEY (`idHistoriaFK`) REFERENCES `historiaclinica` (`idHistoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD CONSTRAINT `FK_idPaciente_historia` FOREIGN KEY (`idPacienteFK`) REFERENCES `paciente` (`idPaciente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `FK_idUsuario_medico` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `FK_idUsuario_paciente` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
