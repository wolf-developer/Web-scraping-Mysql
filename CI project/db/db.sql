/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.1.39-MariaDB : Database - u665212665_antifire
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`u665212665_antifire` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `u665212665_antifire`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `customer_permission` int(1) DEFAULT '0',
  `product_permission` int(1) DEFAULT '0',
  `user_permission` int(1) DEFAULT '0',
  `invoices_permission` int(1) DEFAULT '0',
  `login_permission` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`firstname`,`lastname`,`password`,`customer_permission`,`product_permission`,`user_permission`,`invoices_permission`,`login_permission`) values 
(1,'admin','Alexey','Gamilov','670b14728ad9902aecba32e22fa4f6bd',1,1,1,1,1);

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`Id`,`Name`) values 
(1,'Dry Powder'),
(2,'Co2'),
(5,'Foam'),
(6,'Water'),
(9,'Wet Chemical'),
(10,'Dry Powder Auto'),
(13,'SCBA Sets'),
(14,'EEBD Sets'),
(17,'SCBA cylinders'),
(18,'Medical Oxygen Cyclinders'),
(21,'truck'),
(23,'booter'),
(24,'boot34');

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CompanyName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VatNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LinkId` int(11) NOT NULL,
  `pricelist_id` int(10) DEFAULT NULL,
  `pricelist_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_month` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customers` */

insert  into `customers`(`Id`,`FirstName`,`LastName`,`Address`,`IdNo`,`Email`,`Tel`,`Mob`,`CompanyName`,`VatNo`,`LinkId`,`pricelist_id`,`pricelist_name`,`service_month`) values 
(1,'IGOR','K','dsfs','dsfs','fsjfj@gmail.com','5345','12312','fgdsgsd','41541',0,1,'MainPriceList','September'),
(2,'ivan','V','russia','111','ivan@gmail.com','111','11','wolf','111',0,1,'MainPriceList','June'),
(3,'lose','green','fdd','dd','lose@email.com','111','11','11','11',0,NULL,'testpricelist','August'),
(6,'j','b','m','2321','chrisvell@gmail.com','3434343','79260082','test','tere',0,1,'MainPriceList','September'),
(8,'sergey','A','a','11','sergey@gmail.com','1','1','a','1',0,4,'testpricelist','February2'),
(9,'sda','sada','sadas','12','sd','sad','asd','dfg','sdf',0,3,'DiscountPriceList','July'),
(10,'testfgdgd','test','test','test','test@test.com','test','test','test','test',0,NULL,'DiscountPriceList','June'),
(11,'anothertest','test','test','test','testtest','test','test','test','test',0,1,'MainPriceList','October'),
(12,'test2','test2','test2','test2','test2','test2','test2','test2','test2',0,2,'SalePriceList','August'),
(13,'test3','test3','test3','test3','test3','test3','test3','test3','v',0,1,'MainPriceList','January');

/*Table structure for table `jobsheetdetails` */

DROP TABLE IF EXISTS `jobsheetdetails`;

CREATE TABLE `jobsheetdetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobSheetId` int(11) NOT NULL,
  `ProductName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `ServiceTypeId` int(11) DEFAULT NULL,
  `Tax` int(5) NOT NULL,
  `Discount` int(5) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `JobStatusFK` (`ServiceTypeId`),
  CONSTRAINT `JobStatusFK` FOREIGN KEY (`ServiceTypeId`) REFERENCES `servicetype` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobsheetdetails` */

insert  into `jobsheetdetails`(`Id`,`JobSheetId`,`ProductName`,`ProductId`,`Qty`,`Price`,`ServiceTypeId`,`Tax`,`Discount`) values 
(1,5,'aaa',5,0,12.00,2,12,12),
(2,5,'sda',9,45,25.00,3,25,21);

/*Table structure for table `jobsheets` */

DROP TABLE IF EXISTS `jobsheets`;

CREATE TABLE `jobsheets` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CutomerId` int(11) NOT NULL,
  `JobDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Replacements` tinyint(1) DEFAULT NULL,
  `RepSignature` blob,
  `ClientSignature` blob,
  `StatusId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `StatusFK` (`StatusId`),
  CONSTRAINT `StatusFK` FOREIGN KEY (`StatusId`) REFERENCES `jobstatus` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobsheets` */

insert  into `jobsheets`(`Id`,`CutomerId`,`JobDate`,`Replacements`,`RepSignature`,`ClientSignature`,`StatusId`) values 
(1,1,'2020-08-10 23:32:34',0,'dsadadasdasda','sadadasdasdasdsa',2),
(2,2,'2020-08-11 05:00:57',NULL,NULL,NULL,1),
(3,2,'2020-08-11 05:03:16',NULL,NULL,NULL,1),
(4,2,'2020-08-11 05:05:51',NULL,NULL,NULL,1),
(5,2,'2020-08-11 05:40:01',NULL,NULL,NULL,1);

/*Table structure for table `jobstatus` */

DROP TABLE IF EXISTS `jobstatus`;

CREATE TABLE `jobstatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobstatus` */

insert  into `jobstatus`(`Id`,`Name`) values 
(1,'Open'),
(2,'Processing'),
(3,'Closed');

/*Table structure for table `pricelist` */

DROP TABLE IF EXISTS `pricelist`;

CREATE TABLE `pricelist` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `pricelist` */

insert  into `pricelist`(`id`,`Name`) values 
(1,'MainPriceList'),
(2,'SalePriceList'),
(3,'DiscountPriceList'),
(4,'testpricelist');

/*Table structure for table `pricelistdetails` */

DROP TABLE IF EXISTS `pricelistdetails`;

CREATE TABLE `pricelistdetails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pricelist_id` int(10) NOT NULL,
  `pricelist_name` varchar(250) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `price` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `pricelistdetails` */

insert  into `pricelistdetails`(`id`,`pricelist_id`,`pricelist_name`,`product_id`,`product_name`,`price`) values 
(1,1,'MainPriceList',4,'1Kg Dry Powder','205'),
(2,1,'MainPriceList',8,'dgdsg','102'),
(4,2,'SalePriceList',8,'dgdsg','23');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `CategoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `SubcategoryName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `Barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Qty` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Tax` int(5) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Categories` (`CategoryId`),
  KEY `SubCategories` (`SubCategoryId`),
  CONSTRAINT `Categories` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `SubCategories` FOREIGN KEY (`SubCategoryId`) REFERENCES `subcategories` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`Id`,`Name`,`Description`,`CategoryName`,`CategoryId`,`SubcategoryName`,`SubCategoryId`,`Barcode`,`Qty`,`Price`,`Tax`,`Active`) values 
(5,'aaa','aaa','Foam',5,NULL,NULL,'aaa',0,12.00,12,1),
(7,'sdf','sdfsdf','Medical Oxygen Cyclinders',18,NULL,NULL,'dsf',0,0.00,0,1),
(8,'dgdsg','dfgdfg','truck',21,NULL,NULL,'fdgdfg',0,0.00,0,0),
(9,'sda','sad','Dry Powder Auto',10,NULL,NULL,'asd',45,25.00,25,0);

/*Table structure for table `servicetype` */

DROP TABLE IF EXISTS `servicetype`;

CREATE TABLE `servicetype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `servicetype` */

insert  into `servicetype`(`Id`,`Name`) values 
(1,'On-Site'),
(2,'Workshop'),
(3,'Replacement');

/*Table structure for table `subcategories` */

DROP TABLE IF EXISTS `subcategories`;

CREATE TABLE `subcategories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subcategories` */

insert  into `subcategories`(`Id`,`Name`) values 
(1,'N/A');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `customer_permission` int(1) DEFAULT '0',
  `product_permission` int(1) DEFAULT '0',
  `user_permission` int(1) DEFAULT '0',
  `invoices_permission` int(1) DEFAULT '0',
  `signin_permission` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`firstname`,`lastname`,`password`,`customer_permission`,`product_permission`,`user_permission`,`invoices_permission`,`signin_permission`) values 
(1,'admin','Alexey','Gamilov','000000',1,1,1,1,1),
(2,'greenwolf','Andrey','V','aaaaa',1,1,1,1,1),
(3,'LOSE','green','lose','aaaaa',1,0,0,0,0),
(4,'fex','ivan','G','aaaaaa',0,1,1,0,0),
(5,'joe','borg','borg','1234',0,0,0,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
