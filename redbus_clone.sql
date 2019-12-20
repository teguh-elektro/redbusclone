/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.5.62-log : Database - redbus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`redbus` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `redbus`;

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `seat` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

LOCK TABLES `bus` WRITE;

insert  into `bus`(`id`,`name`,`seat`,`logo`) values 
(1,'kejar setor',50,NULL),
(2,'lintas jawa',33,NULL),
(3,'mentari timur',50,NULL),
(4,'Rosalia Indah',45,'rosalia.jpg'),
(5,'Agramas',50,'agramas.jpg'),
(6,'Sumber Alam',50,'sumberalam.png');

UNLOCK TABLES;

/*Table structure for table `bus_order` */

DROP TABLE IF EXISTS `bus_order`;

CREATE TABLE `bus_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_track_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `bus_order` */

LOCK TABLES `bus_order` WRITE;

insert  into `bus_order`(`id`,`bus_track_id`,`user_id`,`order_id`) values 
(15,1,42,69),
(16,5,42,70),
(17,NULL,42,73),
(18,5,42,74);

UNLOCK TABLES;

/*Table structure for table `bus_track` */

DROP TABLE IF EXISTS `bus_track`;

CREATE TABLE `bus_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_terminal_id` int(11) DEFAULT NULL,
  `destination_terminal_id` int(11) DEFAULT NULL,
  `arrive` datetime DEFAULT NULL,
  `depart` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `origin_city_id` int(11) DEFAULT NULL,
  `destination_city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `bus_track` */

LOCK TABLES `bus_track` WRITE;

insert  into `bus_track`(`id`,`origin_terminal_id`,`destination_terminal_id`,`arrive`,`depart`,`price`,`bus_id`,`origin_city_id`,`destination_city_id`) values 
(1,1,4,'2019-12-17 13:19:13','2019-12-18 17:19:19',200000,1,2,1),
(2,3,5,'2019-12-18 15:20:37','2019-12-20 22:20:47',190000,2,2,1),
(3,6,1,'2019-12-24 23:26:29','2019-12-21 23:26:37',220000,4,12,2),
(4,7,4,'2019-12-23 23:33:57','2019-12-22 23:33:51',230000,4,6,1),
(5,9,8,'2019-12-22 10:59:22','2019-12-22 06:59:03',35000,5,3,9),
(6,9,6,'2019-12-23 10:12:41','2019-12-22 00:12:34',120000,6,3,12);

UNLOCK TABLES;

/*Table structure for table `city_list` */

DROP TABLE IF EXISTS `city_list`;

CREATE TABLE `city_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `city_list` */

LOCK TABLES `city_list` WRITE;

insert  into `city_list`(`id`,`city_name`) values 
(1,'Jakarta'),
(2,'Bandung'),
(3,'Bogor'),
(4,'Tangerang'),
(5,'Semarang'),
(6,'Solo'),
(7,'Kudus'),
(8,'Purwokerto'),
(9,'Kerawang'),
(10,'Bekasi'),
(11,'Depok'),
(12,'Yogyakarta (jogja)'),
(13,'Surabaya'),
(14,'Malang'),
(15,'Denpasar (bali)');

UNLOCK TABLES;

/*Table structure for table `date_order` */

DROP TABLE IF EXISTS `date_order`;

CREATE TABLE `date_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` int(11) DEFAULT NULL,
  `destination` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `date_order` */

LOCK TABLES `date_order` WRITE;

insert  into `date_order`(`id`,`origin`,`destination`,`date`,`user_id`,`order_id`) values 
(67,2,1,'2019-12-17',42,69),
(68,3,9,'2019-12-22',42,70),
(69,3,9,'2019-12-22',42,71),
(70,3,9,'2019-12-31',42,72),
(71,3,12,'2019-12-22',42,73),
(72,3,9,'2019-12-22',42,74);

UNLOCK TABLES;

/*Table structure for table `help` */

DROP TABLE IF EXISTS `help`;

CREATE TABLE `help` (
  `id_category` int(10) NOT NULL AUTO_INCREMENT,
  `name_category` text NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `help` */

LOCK TABLES `help` WRITE;

insert  into `help`(`id_category`,`name_category`) values 
(1,'Dompet saya menunjukkan saldo yang salah'),
(2,'Saya memerlukan bantuan untuk penawaran dan promosi'),
(3,'Saya mengalami masalah dengan layanan pelanggan redBus'),
(4,'Saya memerlukan bantuan untuk program referal redBus'),
(5,'Saya tidak dapat melakukan verifikasi OTP'),
(6,'Saya mengalami beberapa kesalahan teknis pada aplikasi redBus/situs'),
(7,'Butuh bantuan untuk memesan tiket bus baru'),
(8,'Butuh bantuan untuk melakukan pembayaran');

UNLOCK TABLES;

/*Table structure for table `info_order` */

DROP TABLE IF EXISTS `info_order`;

CREATE TABLE `info_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(80) DEFAULT NULL,
  `phone_number` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `info_order` */

LOCK TABLES `info_order` WRITE;

insert  into `info_order`(`id`,`email`,`phone_number`,`name`,`age`,`user_id`,`gender`,`order_id`,`bus_id`) values 
(31,NULL,NULL,'Erdin Suharyadi',2,42,NULL,69,1),
(32,NULL,NULL,'Edo',25,42,NULL,73,NULL),
(33,NULL,NULL,'teguh',40,42,NULL,74,5);

UNLOCK TABLES;

/*Table structure for table `order_list` */

DROP TABLE IF EXISTS `order_list`;

CREATE TABLE `order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `order_list` */

LOCK TABLES `order_list` WRITE;

insert  into `order_list`(`id`,`status`,`user_id`) values 
(70,1,42),
(71,1,42),
(72,1,42),
(73,1,42),
(74,1,42);

UNLOCK TABLES;

/*Table structure for table `payment_order` */

DROP TABLE IF EXISTS `payment_order`;

CREATE TABLE `payment_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `payment_order` */

LOCK TABLES `payment_order` WRITE;

insert  into `payment_order`(`id`,`total`,`paid`,`user_id`,`order_id`) values 
(10,200000,1,42,69),
(11,NULL,1,42,73),
(12,35000,1,42,74);

UNLOCK TABLES;

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id_detail` int(10) NOT NULL AUTO_INCREMENT,
  `id_category` int(10) NOT NULL,
  `name_detail` text NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `questions` */

LOCK TABLES `questions` WRITE;

insert  into `questions`(`id_detail`,`id_category`,`name_detail`,`answer`) values 
(1,1,'Dompet saya menunjukkan saldo yang salah','Anda dapat melihat semua riwayat debit dan kredit pada dompet redBus anda, fitur ini terletak di bagian \'Dompet\' dibawah \'Akun Saya\' yang ada di aplikasi. Semoga ini dapat membantu! Jika anda masih butuh bantuan, silakan mengisi rincian dibawah dan kami dengan senang hati akan membantu anda.'),
(2,1,'Saya memiliki keluhan yang berbeda','Silakan sampaikan pertanyaan anda dengan mengisi rincian dibawah dan dengan senang hati kami akan menolong.'),
(3,1,'Saya tidak dapat menggunakan dana di dompet redBus untuk pemesanan','Sesuai S&K penggunaan dompet untuk pemesanan bus, maksimum dana promo (yang diberikan kepada pelanggan untuk referendi atau promosi cashback yang diberikan oleh redBus) yang dapat digunakan untuk transaksi apa pun dibatasi hingga 20% dari nilai tiket. Misalnya, jika anda memiliki uang tunai Rp.200.000 di dompet anda dan sedang mencoba memesan tiket bus senilai Rp 100.000, maka hanya Rp.20.000 (20% * 100.000) yang dapat digunakan dari dompet anda. Jika anda memerlukan bantuan lebih lanjut, silakan ajukan pertanyaan anda dengan mengisi rincian di bawah ini dan kami akan dengan senang hati membantu.'),
(4,1,'Saya ingin mengetahui syarat & ketentuan mengenai penggunaan dompet redBus','Sesuai S&K penggunaan dompet untuk pemesanan bus, maksimum dana promo (yang diberikan kepada pelanggan untuk referendi atau promosi cashback yang diberikan oleh redBus) yang dapat digunakan untuk transaksi apa pun dibatasi hingga 15% dari nilai tiket. Misalnya, jika anda memiliki uang tunai Rp.200.000 di dompet anda dan sedang mencoba memesan tiket bus senilai Rp 100.000, maka hanya Rp.15.000 (15% * 100.000) yang dapat digunakan dari dompet anda. Jika anda memerlukan bantuan lebih lanjut, silakan ajukan pertanyaan anda dengan mengisi rincian di bawah ini dan kami akan dengan senang hati membantu. '),
(5,2,'Saya tidak dapat menggunakan kode promo','Mohon periksa \'Syarat dan Ketentuan\' kode promo yang anda gunakan pada saat pemesanan, gunanya untuk memeriksa apakah anda memenuhi syarat untuk menerima diskon (anda dapat melihat promo terkini beserta dengan S&K nya di https://www.redbus.id/en/info/offerterms). Silakan verifikasi jumlah maksimum kode promo yang bisa digunakan dan harga tiket minimal yang disebutkan di S&K. Jika anda merasa bahwa anda sudah memenuhi syarat untuk menerima diskon, silakan sampaikan keluhan dengan mengisi rincian dibawah dan kami dengan senang hati akan membantu.'),
(6,2,'Saya ingin tahu lebih lagi mengenai penawaran redBus','Anda dapat melihat promo terkini beserta dengan S&K nya di https://www.redbus.id/en/info/offerterms)'),
(7,2,'Saya memiliki keluhan yang berbeda','Silakan sampaikan pertanyaan anda dengan mengisi rincian dibawah dan dengan senang hati kami akan menolong.'),
(8,3,'Saya mengalami perilaku yang tidak profesional dari agen layanan','Mohon maaf atas ketidaknyamanan nya! Silakan sampaikan rinciannya dibawah, mengenai pengalaman buruk yang anda hadapi.'),
(9,3,'Saya tidak menghubungi tim layanan','Mohon maaf atas ketidaknyamanan nya! Mohon sampaikan kepedulian anda dibawah, dan tim kami akan segera menghubungi anda.'),
(10,3,'Saya diberitahu informasi yang salah atau tidak lengkap','Mohon maaf atas ketidaknyamanan nya! Silakan sampaikan rinciannya dibawah, mengenai pengalaman buruk yang anda hadapi. Kami akan segera mempelajari dan mengambil langkah yang diperlukan.\r\n+62'),
(11,3,'Email saya tidak direspon','Mohon maaf atas ketidaknyamanan nya! Mohon sampaikan keluhan anda dibawah, dan tim kami akan segera menghubungi anda.'),
(12,3,'Saya disuruh menunggu untuk waktu yang lama','Mohon maaf atas ketidaknyamanan nya! Silakan sampaikan rinciannya dibawah, mengenai pengalaman buruk yang anda hadapi. Kami akan segera mempelajari dan mengambil langkah yang diperlukan.'),
(13,3,'Saya tidak dihubungi kembali seperti yang telah dijanjikan','Mohon maaf atas ketidaknyamanan nya! Mohon sampaikan keluhan anda dibawah, dan tim kami akan segera menghubungi anda.'),
(14,4,'Saya memerlukan bantuan untuk mereferensikan teman','Silakan kunjungi bagian \'Referensikan dan dapatkan\' dibawah \'Akun saya\' pada aplikasi redBus. Anda dapat melihat kode referal anda dan tautan referal disana. Harap perhatikan bahwa program referal hanya tersedia pada versi terbaru di Android redBus dan aplikasi iOS. Juga pastikan bahwa anda sudah memberikan nomor telepon yang benar dan memverifikasinya dengan OTP, saat melakukan pendaftaran di redBus. Jika anda butuh keterangan lebih lanjut, silakan isi rincian dibawah dan kami akan segera membantu.'),
(15,4,'Saya tidak dapat menggunakan kode referal teman saya','Maaf atas ketidaknyamanan nya! Silakan sampaikan keluhan anda dibawah dan kami akan membantu anda.'),
(16,4,'Saya memiliki keluhan yang berbeda','Silakan sampaikan pertanyaan anda dengan mengisi rincian dibawah dan dengan senang hati kami akan menolong.'),
(17,4,'Saya telah mendaftar dengan menggunakan kode referal tetapi tidak ada dana yang dikirimkan kepada saya','\"Orang yang direferensikan akan mendapatkan 80.000 poin redBus sebagai hadiah dalam dompet redBus dalam waktu 24 jam setelah pendaftaran & yang mereferensikan akan mendapatkan 40.000 poin redBus di dompet redBus dalam waktu 24 jam setelah temannya mendaftar di redBus dengan syarat kriteria yang disebutkan di bawah dipenuhi.\r\n * Anda telah memberikan nomor telepon yang valid dan memverifikasinya dengan OTP, saat mendaftar di redBus. Jika anda belum memverifikasi nomor ponsel anda dengan OTP, anda tidak akan mendapat bonus referal. Meskipun teman anda, yang mereferensikan anda, akan mendapatkan Rp40.000 ketika anda mendaftar\r\n * Anda menggunakan kode referensi saat memesan tiket anda\r\n * Anda menggunakan versi terbaru dari aplikasi redBus Android atau iOS\r\n * Hanya satu pendaftaran yang diizinkan per perangkat.\r\n * Poin RedBus berlaku selama 6 bulan setelah ditambahkan ke dompet. Setelah itu akan kedaluwarsa dan tidak dapat digunakan.\r\n * Hadiah tertinggi untuk referensi yang dapat dicapai adalah 800.000 poin redbus\r\n * Semua agen, yang telah bekerjasama dengan redBus, tidak dapat mendapatkan manfaat dari \"Program Bagi dan Dapatkan\"\r\n \r\n Jika anda memerlukan bantuan lebih lanjut, silakan ajukan pertanyaan anda dengan mengisi rincian di bawah ini dan kami akan dengan senang hati membantu. Jangan lupa menyebutkan nomor telepon anda dan teman anda, sehingga kami dapat menyelesaikan pertanyaan anda dengan lebih cepat! \"'),
(18,4,'Teman saya sudah melakukan perjalanan tetapi bonus belum dikirim kepada saya','Setelah teman anda mendaftar dengan kode referensi dan memverifikasi nomor teleponnya pada aplikasi redBus terbaru, anda akan mendapatkan Rp.40.000 di dompet redBus dalam waktu 24 jam setelah pendaftaran tersebut, asalkan memenuhi kriteria berikut: - anda dapat menemukan rincian S&K nya di sini) - Bonus referal hanya berlaku untuk 6 bulan. - Anda bisa mendapatkan maksimal Rp 800.000 sebagai hadiah referensi- Hanya satu pendaftaran diizinkan per perangkat. Jika anda memerlukan bantuan lebih lanjut, silakan ajukan pertanyaan anda dengan mengisi rincian di bawah ini dan kami akan dengan senang hati membantu. Jangan lupa menyebutkan nomor telepon anda dan teman anda, sehingga kami dapat menyelesaikan pertanyaan anda lebih cepat!'),
(19,5,'Saya tidak dapat melakukan verifikasi OTP','Saya tidak dapat melakukan verifikasi OTP\r\nMohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(20,6,'Saya tidak bisa login','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(21,6,'Saya ingin menonaktifkan akun redBus saya','Kami turut sedih karena anda ingin menonaktifkan akun redBus anda! Silakan isi rincian dibawah, dan tim kami akan segera membantu anda. Coba pertimbangkan lagi dan beritahu kami bagian mana yang bisa kami perbaiki. Masukan anda sangat berharga bagi kami.'),
(22,6,'Saya ingin mengubah rincian profil redBus saya','Ya! Silakan bagikan permohonan anda dibawah. Kami akan memeriksa kemungkinannya bersama tim teknis, dan akan segera menginformasikan kepada anda.'),
(23,6,'Saya tidak dapat mengatur ulang kata sandi','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(24,6,'Saya mendapati kesalahan yang berkata \"Üps! Tidak ada bus yang ditemuakan','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(25,6,'Saya tidak ingin menerima email/SMS promosi','Kami tidak akan menggangu anda lagi jika anda tidak suka menerima email promo dari kami. Anda dapat berhenti langganan dengan cara scroll ke bagian bawah email yang telah kami kirimkan kepada anda dan klik tombol Berhenti Berlangganan atau isi rincian dibawah jadi kami bisa melakukan tindakan yang diperlukan.'),
(26,6,'Saya tidak dapat memilih pilihan pembayaran','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(27,6,'Saya melihat tampilan tarif yang salah pada portal redBus','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(28,6,'Saya tidak dapat melebihi pilihan pencarian','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(29,6,'Saya tidak dapat menilai dan mengulas operator bus','Mohon maaf atas ketidaknyamanan anda! Silakan sampaikan keluhan anda dibawah, tim kami akan segera membantu anda.'),
(30,7,'Bantuan untuk ketentuan tarif anak','Silakan sampaikan permintaan anda dibawah. Staf kami akan segera membantu anda.'),
(31,7,'Bantuan untuk ketentuan bagasi','Silakan sampaikan permintaan anda dibawah. Staf kami akan segera membantu anda.'),
(32,7,'Bantuan penggunaan situs atau aplikasi','Bantuan penggunaan situs atau aplikasi\r\nSilakan sampaikan permintaan anda dibawah. Staf kami akan segera membantu anda.'),
(33,8,'Bantuan untuk transfer bank manual','Anda dapat mentransfer dengan menggunakan ATM / M-Banking & Internet Banking. Harap perhatikan bahwa transfer LLG, Kliring, SKBNI & RTGS tidak dapat dilakukan. Mohon membayar hingga 3 digit terakhir. Karena ini adalah transfer manual, mungkin akan ada keterlambatan dalam pembuatan tiket. Jika anda membutuhkan bantuan lebih lanjut, harap ajukan permintaan anda di bawah ini. Salah satu tim kami akan segera membantu anda.');

UNLOCK TABLES;

/*Table structure for table `seat_order` */

DROP TABLE IF EXISTS `seat_order`;

CREATE TABLE `seat_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `seat_order` */

LOCK TABLES `seat_order` WRITE;

insert  into `seat_order`(`id`,`bus_id`,`seat_number`,`user_id`,`order_id`) values 
(18,1,10,42,69),
(19,NULL,10,42,73),
(20,5,10,42,74);

UNLOCK TABLES;

/*Table structure for table `terminal_list` */

DROP TABLE IF EXISTS `terminal_list`;

CREATE TABLE `terminal_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `terminal_list` */

LOCK TABLES `terminal_list` WRITE;

insert  into `terminal_list`(`id`,`name`,`city_id`) values 
(1,'bandung kota',2),
(2,'cimahi',2),
(3,'ciamis',2),
(4,'jakarta kota',1),
(5,'monas',1),
(6,'Giwangan',12),
(7,'Tirtonadi',6),
(8,'Klari',9),
(9,'Baranang-Siang',3),
(10,'Pulo Gebang',1);

UNLOCK TABLES;

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

/*Data for the table `token` */

LOCK TABLES `token` WRITE;

insert  into `token`(`id`,`token`,`status`) values 
(98,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDIsInJvbGUiOiIwIiwiaWF0IjoxNTc2ODU2MDUxLCJleHAiOjE1NzY5NDI0NTF9.95GC--6ygsWNvim24Jajbu_ZSYk0FBfwgyEr6_Hsl54',0),
(99,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDIsInJvbGUiOjAsImlhdCI6MTU3Njg2MTgzOSwiZXhwIjoxNTc2OTQ4MjM5fQ.1fSu8ksfUSOUzxTxyylVzTmuVyIPRn0NgmG9WncnEig',0),
(100,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDIsInJvbGUiOjAsImlhdCI6MTU3Njg2MzM3NiwiZXhwIjoxNTc2OTQ5Nzc2fQ.AWusEcOrybUL4Oe0-rekehATh9Tb7oW3_14FwAg4r6k',1),
(101,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDIsInJvbGUiOjAsImlhdCI6MTU3Njg3MTkyNiwiZXhwIjoxNTc2OTU4MzI2fQ.NkwKPONXXaSf9gcCXn26NKKCnGd3W-pA_4me_F-InHo',1);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`phone_number`,`email`,`password`,`name`,`date_of_birth`,`gender`,`photo`,`role`) values 
(42,'089501019876','erdinsuharyadi@gmail.com','erdinsuharyadi','Erdin Suharyadi','2019-12-31','1',NULL,0);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
