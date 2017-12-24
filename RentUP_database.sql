
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `RentUP_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `RentUP_database`;

-- Δομή για τον πίνακα 'EMPLOYEE'

DROP TABLE IF EXISTS `EMPLOYEE`;

CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
  `Irs` int(8) NOT NULL ,
  `FirstName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SSN` int(8) NOT NULL ,
  `DrivingLicence` int(8) NOT NULL,
  `City` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Street` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `StreetNumber` int(3) NOT NULL ,
  `PostalCode` int(5) NOT NULL ,
  PRIMARY KEY (`Irs`)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;



INSERT INTO `EMPLOYEE` (`Irs`,`FirstName`,`LastName`,`SSN`,`DrivingLicence`,`City`,`Street`,`StreetNumber`, `PostalCode` ) VALUES
(81545441,'Jon','Anastasakhs', '12365478', '69696969','Athens', 'Tripoleos', '14', '15945'),
(81564840,'Antonis', 'Papas', '15975364', '12121212', 'Athens', 'Agapis', '15', '15945'),
(88612611,'Panagiwta', 'Trikalinou', '54123679','12548778', 'Athens', 'Menelaou', '16', '15945'),
(8547611,'Mitsos', 'Karras', '43167121', '12344321', 'Athens', 'Petrou Rali', '17', '15945'),
(88413110,'Epameinondas', 'Makedonas', '28713946', '56788765','Athens', 'Papanikoli', '18', '15945'),
(81224210,'Xrhstos', 'Dosis', '13467952', '65499456', 'Athens', 'Kolokotrwnh', '19', '15945'),
(81155480,'Dave','Papadopoulos', '45214789', '34696431', 'Athens', 'Agapis', '20', '15945'),
(81568470,'Paulos', 'Aramis', '98561472', '54899854','Athens', 'Agapis', '21', '15945'),
(86493170,'George', 'Theodoropoulos', '11115555', '22558877','Athens', 'Agapis', '22', '15945'),
(81800200,'Koulis', 'Abraam', '13421864', '32146842','Athens', 'Agapis', '23', '15945'),
(89189119,'Vassiliki', 'Tassopoulou', '54698732', '66555599', 'Athens', '', '24', '15945'), 
(85171900,'Maria', 'Papadaki', '5415167182', '66118155599', 'Thessaloniki', 'Tsimiski', '13', '13456'),
(81765436, 'Aikaterini','Metallinou', '3572637031', '9721219820', 'Xanthi', 'Aggelwn','4', '91910'),
(8456789, 'Irene','Telalh', '3573718031', '8199181716', 'Athens', 'Damaskinou','6', '17545'),
(808147102, 'Fwteini','Strati', '35714418031', '810018109', 'Athens', 'Kallipoleos','6', '17545'),
(80872010, 'Kwstas','Anapalis', '89100526781', '01019728', 'Athens', 'Damaskinou','6', '17545');



-- 
-- Δομή για προβολή `EMPLOYEE_VIEW` ενημερώσιμο κομμάτι του πίνακα employee
-- Ενημερώσιμο σημαίνει ότι δεν χρησιμοποιείται σε αλλους πίνακες όπου θα χρειαζόμαστε triggrs για να κάνουμε update
-- νομίζω μπορούμε να τα βάλουμε όλα
-- 

DROP VIEW IF EXISTS `EMPLOYEE_VIEW`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EMPLOYEE_VIEW` 
AS select `EMPLOYEE`.`Irs` AS `Irs`,
`EMPLOYEE`.`FirstName` AS `FirstName`,
`EMPLOYEE`.`LastName` AS `LastName`,
`EMPLOYEE`.`City` AS `City`,
`EMPLOYEE`.`Street` AS `Street`,
`EMPLOYEE`.`StreetNumber` AS `StreetNumber`,
`EMPLOYEE`.`PostalCode` AS `PostalCode`
from `EMPLOYEE`;



-- Δομή για τον πίνακα 'VEHICLE'

DROP TABLE IF EXISTS `VEHICLE`;

CREATE TABLE IF NOT EXISTS `VEHICLE` (
  `LicencePlate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Make` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Model` varchar(20) COLLATE utf8_unicode_ci,
  `CylinderCapacity` int(11) COLLATE utf8_unicode_ci,
  `HorsePower` int(11) COLLATE utf8_unicode_ci,
  `FuelType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Year` int(4) NOT NULL,
  `Kilometres` int(11) NOT NULL,
  `LastService` date NOT NULL,
  `NextService` date NOT NULL,
  `InsuranceExpiration` date NOT NULL,
  `Damages` varchar(50) ,
  `Malfunctions` varchar(50),	
  PRIMARY KEY (`LicencePlate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;



INSERT INTO `VEHICLE` (`LicencePlate`,`Type`,`Make`,`Model`,`CylinderCapacity`,`HorsePower`,`FuelType`,`Year`,`Kilometres`,`LastService`,`NextService`,`InsuranceExpiration`,`Damages`,`Malfunctions`)
VALUES
('as561','Hatchback','TOYOTA.','Yaris', 23, 707  ,'Diesel',2017,50, 2017-09-09, 2018-09-09, 2022-07-09, 'none', 'none'),
('io718','Sedan','TOYOTA.','Augo', 16,707  ,'Diesel',2017,60, 2017-08-09, 2018-09-09,2022-07-09, 'none', 'none'),
('pa019','MPV','HONDA','Civic', 23,750  ,'Diesel',2015,1000, 2000-07-09, 2018-09-09, 2020-07-09, 'none', 'none'),
('as781','SUV','FORD','Galaxy', 18, 755  ,'Diesel',2107,50, 2017-06-09,2019-09-09, 2022-07-09, 'none', 'none'),
('kl191','Crossover','HONDA','Jazz', 23, 750 ,'Diesel',2016,0,2017-06-09, 2109-09-09, 2022-07-09, 'none', 'none'),
('pa912','Coupe','MAZDA','Mazda3', 23, 740  ,'Diesel',2015,500, 2017-06-09, 2109-09-09,2020-07-09, 'none', 'none'),
('oo191','Convertible','HONDA','Jazz', 23, 750 ,'Diesel',2015,1000, 2017-06-09, 2019-09-09,2020-07-09, 'none', 'none'),
('pq102','SUV','TOYOTA','Verso', 19, 707 ,'Diesel',2017,50,2017-06-09, 2109-09-09,2022-07-09, 'none', 'none'),
('we261','Convertible','MAZDA','Mazda2', 23, 740 ,'Diesel',2017,30, 2017-06-09,2019-09-09,2020-07-09, 'none', 'none'),
('re167','Coupe','MAZDA','Mazda3', 21, 740  ,'LPG Autogas',2015,50, 2017-06-09, 2019-09-09, 2020-07-09, 'none', 'none'),
('ip516','SUV','FORD','Kuga', 23, 755 ,'Diesel',2016,100, 2017-06-09, 2017-06-09, 2020-07-09, 'none', 'none'),
('bv590','Hatchback','MAZDA','Mazda2', 23, 740 ,'Diesel',2015,1000, 2017-06-09, 2019-09-09, 2020-07-09, 'none', 'none'),
('la719','MPV','NISSAN','Micra', 23, 720  ,'LPG Autogas',2014,5000,2017-06-09, 2109-09-09, 2022-07-09, 'none', 'none'),
('er167','Hatchback','MAZDA','Mazda3', 23, 740 ,'Diesel',2015,1000,2017-06-09,2018-09-09, 2022-07-09, 'none', 'none'),
('ui919','Hatchback','BMW','X1', 23, 592  ,'Super unleaded petrol',2017,60,2017-06-09,2019-09-09, 2022-07-09, 'none', 'none'),
('ty717','SUV','TOYOTA','Yaris', 23, 707 ,'Super unleaded petrol',2016,500,2017-06-09, 2018-09-09,  2022-07-09, 'none', 'none'),
('un183','Hatchback','NISSAN','Qashqai', 23, 720 ,'Diesel',2015,1000,2017-06-09, 2019-09-09,  2022-07-09, 'none', 'none'),
('un184','Hatchback','TOYOTA','Yaris', 23, 707 ,'Diesel',2016,900,2017-06-09, 2019-09-09,  2022-07-09, 'none', 'none'),
('un180','Hatchback','BMW','3 Series', 23, 592 ,'Super unleaded petrol',2017,20,2017-06-09,2019-09-09, 2022-07-09, 'none', 'none'),
('un185','Hatchback','HONDA','Jazz', 23, 750 ,'Super unleaded petrol',2016,500,2017-06-09, 2019-09-09,  2022-07-09, 'none', 'none');




-- Δομή για τον πίνακα 'CUSTOMERS'

DROP TABLE IF EXISTS `CUSTOMERS`;

CREATE TABLE IF NOT EXISTS `CUSTOMERS` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SSN` int(11) NOT NULL ,
  `Irs` int(8) NOT NULL,
  `DrivingLicence` int(11) NOT NULL,
  `FirstRegistration` date NOT NULL,
  `City` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Street` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `StreetNumber` int(3) NOT NULL ,
  `PostalCode` int(4) NOT NULL ,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `CUSTOMERS` (`CustomerId`,`FirstName`,`LastName`,`SSN`,`Irs`,`DrivingLicence`,`FirstRegistration`,`City`,`Street`,`StreetNumber`, `PostalCode` ) VALUES
(1,'Jonny','Anastasiou', 12365478, 69696969,'154153212',2010-05-01,'Athens', 'Agapis', 14, 15945),
(2,'Antony', 'Papapetropoulos', 15975344, 2219191212, '14785455', 2010-05-01,'Athens', 'Kallipoleos', 15, 15945),
(3,'Vasilis', 'Papapetrou', 159753226, 7289212, '18191675', 2010-05-01,'Athens', 'Kallipoleos', 15, 15945),
(4,'Irene', 'Telali', 15975344, 2212516712, '147178191', 2010-05-01,'Athens', 'Avramidou', 15, 15945),
(5,'Savvina', 'Siakou', 15975344, 22121212, '1178191891', 2010-05-01,'Thessaloniki', 'Kallipoleos', 15, 18718),
(6,'Oresths', 'Lamprou', 15975156, 225171991, '118191911', 2010-05-01,'Athens', 'Manwla', 1, 15945),
(7,'Antonis', 'Kappos', 159751728, 22145612, '345678888', 2010-05-01,'Athens', 'Kallipoleos', 15, 15945),
(8,'Vassia', 'Manwla', 1591891344, 2112212, '14345675', 2010-05-01,'Athens', 'Ifikratous', 15, 15945),
(9,'Maria', 'Papadaki', 15934567, 17189191, '14165178', 2010-05-01,'Athens', 'Diogenh', 15, 15945),
(10,'Eirhnh', 'Zafeiri', 114517891, 2892928, '01981716', 2010-05-01,'Athens', 'Thalias', 81, 15945),
(11,'Kwstas', 'Stauropoulos', 34567189, 51671989, '31456718', 2010-05-01,'Athens', 'Kifisias', 1511, 15945),
(12,'Stefanos', 'Stefanopoulos', 13456781, 25662782, '11917611', 2010-05-01,'Athens', 'Markou Mpotsari', 95, 15945),
(13,'Philipos', 'Diakopoulos', 11238921, 18273636, '16718819', 2010-05-01,'Athens', 'Theofilou', 34, 15945),
(14,'Stathis', 'Rodomagoulakis', 41282819, 91827353, '14167818', 2010-05-01,'Athens', 'Lewkoriou', 67, 15945),
(15,'Anna', 'Statha', 45167810, 17818922, 215617819, 2010-05-01,'Athens', 'Tripolews', 89, 15945),
(16,'Vallia', 'Kerkyridi', 1824292, 31567188, 728723893, 2010-05-01,'Athens', 'Papanikolaou', 9, 15945);

-- 
-- Δομή για προβολή `CUSTOMERS_VIEW` ενημερώσιμο κομμάτι του πίνακα customers
-- Ενημερώσιμο σημαίνει ότι δεν χρησιμοποιείται σε αλλους πίνακες όπου θα χρειαζόμαστε triggrs για να κάνουμε update
-- νομίζω μπορούμε να τα βάλουμε όλα
-- 

/*
SELECT DISTINCT FirstName
FROM EMPLOYEE
WHERE EMPLOYEE.StreetNumber > 15
; */
DROP VIEW IF EXISTS `CUSTOMERS_VIEW`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `CUSTOMERS_VIEW` 
AS select `CUSTOMERS`.`CustomerId` AS `CustomerId`,
`CUSTOMERS`.`FirstName` AS `FirstName`,
`CUSTOMERS`.`LastName` AS `LastName`,
`CUSTOMERS`.`City` AS `City`,
`CUSTOMERS`.`Street` AS `Street`,
`CUSTOMERS`.`PostalCode` AS `PostalCode`
from `CUSTOMERS`;



-- Δομή για τον πίνακα 'STORE'


DROP TABLE IF EXISTS `STORE`;

CREATE TABLE IF NOT EXISTS `STORE` (
  `StoreId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNumber` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email`varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `City` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Street` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `StreetNumber` int(3) NOT NULL ,
  `PostalCode` int(4) NOT NULL ,
  PRIMARY KEY (`StoreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;



INSERT INTO `STORE` (`StoreId`,`Name`,`PhoneNumber`,`Email`,`City`,`Street`,`StreetNumber`,`PostalCode` ) VALUES
(30, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Athens', 'Khfisias', 134, 14568),
(31, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Thessaloniki', 'Tsimiski', 134, 14568),
(32, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Athens', 'Argostoliou', 134, 14568),
(33, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Thessaloniki', 'M.Alexandrou', 134, 14568),
(34, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Argos', 'Argous', 3, 14568),
(35, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Xanthi', 'Ampelwn', 4, 14568),
(36, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Xania', 'Mauromixalh', 134, 14568),
(37, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Thessaloniki', 'Vastouni', 130, 14568),
(38, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Hrakleio', 'Korinthou', 125, 14568),
(39, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Athens', 'Khfisias', 3, 14568),
(40, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Patra', 'Argostoliou', 27, 14568),
(41, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Athens', 'Khfisias', 89, 14568),
(42, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Iwannina', 'Tripolitsas', 25, 14568),
(43, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Agrinio', 'Fassianou', 134, 14568),
(44, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Parta', 'Gianitsws', 134, 14568),
(45, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Arta', 'Menelaou', 134, 14568),
(46, 'RentUp', '2109716617','rentupadmin@rentup.gr', 'Komothnh', 'Anapali', 134, 14568);




-- Δομή για τον πίνακα 'RENTS'


DROP TABLE IF EXISTS `RENTS`;

CREATE TABLE IF NOT EXISTS `RENTS` (
  `RentId` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) NOT NULL,
  `Irs` int(8) NOT NULL,
  `LicencePlate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `FinishDate` date NOT NULL,
  `StartDate` date NOT NULL,
  `StartLocation` varchar(30) NOT NULL,
  `FinishLocation` varchar(30) NOT NULL,
  `ReturnState`  varchar(30) NOT NULL,
  CONSTRAINT Fk_CustomerId FOREIGN KEY (`CustomerId`) 
    REFERENCES CUSTOMERS(`CustomerId`) ON DELETE CASCADE,
  CONSTRAINT Fk_Irs FOREIGN KEY (`Irs`) 
    REFERENCES EMPLOYEE(`Irs`) ON DELETE NO ACTION,
  CONSTRAINT Fk_LicencePlate FOREIGN KEY (`LicencePlate`) 
    REFERENCES VEHICLE(`LicencePlate`) ON DELETE CASCADE,
  PRIMARY KEY (`RentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;


INSERT INTO `RENTS` (`RentId`, `CustomerId`, `Irs`, `LicencePlate`, `FinishDate`, `StartDate`, `StartLocation`, `FinishLocation`, `ReturnState`) VALUES 
(1, 5, 8456789, 'un180', '2017-12-14', '2017-1-05', 'athens', 'athens', 'ok'),
(2, 7, 8456789, 'ty717', '2017-12-16', '2017-2-05', 'athens', 'athens', 'ok'),
(3, 4, 8456789, 'ui919', '2017-12-14', '2017-2-05', 'athens', 'athens', 'ok'),
(4, 9, 8456789, 'er167', '2017-11-17', '2017-3-05', 'Patra', 'athens', 'ok'),
(5, 7, 8456789, 'la719', '2017-10-22', '2016-12-25', 'athens', 'athens', 'ok'),
(6, 8, 8456789, 'bv590', '2017-12-2', '2017-09-05', 'athens', 'athens', 'ok'),
(7, 9, 81800200, 'ip516', '2017-12-1', '2017-09-05', 'athens', 'athens', 'ok'),
(8, 2, 81800200, 're167', '2017-11-8', '2017-12-07', 'Patra', 'athens', 'ok'),
(9, 3, 81800200, 'pq102', '2017-11-14', '2017-11-05', 'athens', 'athens', 'ok'),
(10, 3, 81800200, 'oo191', '2017-09-14', '2017-07-19', 'athens', 'athens', 'ok'),
(11, 7, 81800200, 'we261', '2017-09-14', '2017-06-05', 'athens', 'athens', 'ok'),
(12, 5, 81800200, 'kl191', '2017-06-14', '2017-01-12', 'athens', 'athens', 'ok'),
(13, 9, 81800200, 'pa912', '2017-05-14', '2016-12-05', 'Agrinio', 'athens', 'ok'),
(14, 9, 81800200, 'io718', '2017-12-17', '2016-12-17', 'Argos', 'athens', 'ok'),
(15, 5, 81800200, 'pa019', '2017-12-13', '2017-12-19', 'Patra', 'athens', 'ok'),
(16, 8, 81568470, 'as561', '2017-12-13', '2017-12-20', 'Iwannina', 'athens', 'ok');



-- Δομή για τον πίνακα 'PAYMENTS'


DROP TABLE IF EXISTS `PAYMENT`;

CREATE TABLE IF NOT EXISTS `PAYMENT` (
  `PaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentAmount` int(5) NOT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  `RentId` int ,
   CONSTRAINT Fk_RentId FOREIGN KEY(RentId)
   REFERENCES RENTS(RentId)  
   ON DELETE CASCADE,
   PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

INSERT INTO `PAYMENT` (`PaymentId`,`PaymentAmount`,`PaymentMethod`,`RentId`)
VALUES
(1,100000,'Paypal', 15),
(2,100000,'Paypal', 3),
(3,100000,'Paypal', 8),
(4,100000,'Paypal', 6),
(5,100000,'Paypal', 7),
(6,100000,'Paypal', 11),
(7,100000,'Paypal', 10),
(8,100000,'Paypal', 14),
(9,100000,'Paypal', 12),
(10,100000,'Paypal', 4),
(11,100000,'Paypal', 1),
(12,100000,'Paypal', 2),
(13,100000,'Paypal', 5),
(14,100000,'Paypal', 9),
(15,100000,'Paypal', 16),
(16,100000,'Paypal', 13);



-- VIEW που δεν γίνεται update

DROP VIEW IF EXISTS `PAYMENT_METHOD_VIEW`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `PAYMENT_METHOD_VIEW` 
AS select DISTINCT PAYMENT.PaymentMethod AS `PaymentMethod`, RENTS.RentId AS `RentId`
from PAYMENT
INNER JOIN RENTS
ON PAYMENT.RentId = RENTS.RentId;



-- Δομή για τον πίνακα 'WORKS'


DROP TABLE IF EXISTS `WORKS`;

CREATE TABLE IF NOT EXISTS `WORKS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StoreId` int(11),
  `Irs` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `FinishDate` date ,
  `Position` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
   PRIMARY KEY (`id`),
   CONSTRAINT Fk_StoreId_Works FOREIGN KEY (`StoreId`) 
     REFERENCES STORE(`StoreId`) ON DELETE CASCADE,
   CONSTRAINT Fk_Irs_Works FOREIGN KEY (`Irs`) 
     REFERENCES EMPLOYEE(`Irs`) ON DELETE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;



INSERT INTO `WORKS` (`id`,`StoreId`,`Irs`,`StartDate`,`FinishDate`,`Position`)
VALUES
(1, 30, 8456789, '2012-09-1', 'null', 'Manager'),
(2, 33,8547611, '2013-09-1', 'null', 'Accountant'),
(3, 34, 80872010, '2014-09-1', 'null', 'Engineer'),
(4, 32, 81155480, '2012-09-1', 'null', 'Manager'),
(5, 31, 81224210, '2012-09-1', 'null', 'Officer'),
(6, 45, 81545441, '2012-09-1', 'null', 'Financial Manager'),
(7, 43, 81564840, '2015-09-1', 'null', 'Customer Support'),
(8, 42, 81568470, '2017-09-1', 'null', 'Assistant'),
(9, 41, 81765436, '2017-09-1', 'null', 'Manager'),
(10, 39, 81800200, '2015-09-1', 'null', 'Manager'),
(11, 37, 85171900, '2016-09-1', 'null', 'Assistant'),
(12, 36, 86493170, '2013-09-1', 'null', 'Assistant'),
(13, 35, 88413110, '2014-09-1', 'null', 'Assistant'),
(14, 40, 88612611, '2011-09-1', 'null', 'Assistant'),
(15, 44, 89189119, '2012-09-1', 'null', 'Assistant'),
(17, 44, 808147102, '2012-09-1', 'null', 'Accountant');



-- Δομή για τον πίνακα 'HANDLES'


DROP TABLE IF EXISTS `HANDLES`;

CREATE TABLE IF NOT EXISTS `HANDLES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StoreId` int(11) NOT NULL,
  `LicencePlate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
   PRIMARY KEY (`id`),
   KEY `StoreId` (`StoreId`),
   KEY `LicencePlate` (`LicencePlate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;


INSERT INTO `HANDLES` (`id`,`StoreId`,`LicencePlate`)
VALUES
(1, 30, 'ACV-9180')
(1, 30, 'ALA-1891')
(1, 32, 'AJA-1921')
(1, 37, 'IAN-5161')
(1, 40, 'OOL-5171')
(1, 41, 'AAS-1920')
(1, 42, 'ARR-1721')
(1, 45, 'TTR-9111')


-- Δομή για τον πίνακα 'RESERVES'

DROP TABLE IF EXISTS `RESERVES`;

CREATE TABLE IF NOT EXISTS `RESERVES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StoreId` int(11) NOT NULL,
  `LicencePlate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerId`
  `Irs` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `FinishDate` date NOT NULL,
  `StartLocation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `FinishLocation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Paid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
   PRIMARY KEY (`id`),
   KEY `StoreId` (`StoreId`),
   KEY `Irs` (`Irs`),
   KEY `LicencePlate` (`LicencePlate`)
   KEY `CustomerId` (`CustomerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;



INSERT INTO `RESERVES` (`id`,`StoreId`,`LicencePlate`,`CustomerId`,'Irs',`StartDate`,`FinishDate`,`StartLocation`,`FinishLocation`,`Paid`)
VALUES
(1,30,'ASR-0990', '154153212', 4 ,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(2,31,'ART-1980', '2219191212', 5,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(3,36,'QTU-0990', '147178191',6,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(4,35,'OPA-0671', '728723893',6,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(5,39,'OAO-0178', '215617819',7,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(6,30,'LPL-1928', '154153212',8,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(7,40,'ATH-6711', '154153212',8,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(8,42,'GAN-0120', '154153212',10,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(9,43,'TAH-0128', '154153212',10,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(10,45,'ASR-9211', '154153212',1,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(11,34,'TTA-8191', '154153212',13,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(12,30,'ASR-2991', '154153212',5,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(13,30,'ASR-9276', '154153212',2,'2017-12-06','2018-01-15','athens','athens', 'Paid')
(14,30,'UUU-1210', '154153212',7,'2017-12-06','2018-01-15','athens','athens', 'Paid')



-- FIRST TRIGGER
DROP TRIGGER IF EXISTS `TR_PAYMENT_ON_RENT_DELETE`;

DELIMITER //

CREATE TRIGGER `TR_PAYMENT_ON_RENT_DELETE` BEFORE DELETE ON `RENTS`
FOR EACH ROW
	BEGIN 
		DELETE FROM `PAYMENT` WHERE `PAYMENT`.`RentId` = `OLD`.`RentId`;
	END
//
DELIMITER ;

-- SECOND TRIGGER



DROP TRIGGER IF EXISTS `TR_PAYMENT_ON_RENT_INSERT`;

DELIMITER //

CREATE TRIGGER `TR_PAYMENT_ON_RENT_INSERT` AFTER INSERT ON `RENTS`
FOR EACH ROW
	BEGIN 
		INSERT INTO `PAYMENT` (`PaymentAmount`,`PaymentMethod`,`RentId`) VALUES (0, 0, NEW.`RentId`);
	END
//
DELIMITER ;

DROP TRIGGER IF EXISTS `NEW_EMPLOYEE_INSERT_TRIGGER`;

DELIMITER //

CREATE TRIGGER `NEW_EMPLOYEE_INSERT_TRIGGER` AFTER INSERT ON `EMPLOYEE`
FOR EACH ROW
	BEGIN 
		INSERT INTO `WORKS` (`StoreId`,`Irs`,`StartDate`,`FinishDate`,`Position`) VALUES (NULL, NEW.`Irs`, CURDATE(), NULL, 'Unknown');
	END
//
DELIMITER ;
 

