/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - koperasi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`koperasi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `koperasi`;

/*Table structure for table `t_anggota` */

DROP TABLE IF EXISTS `t_anggota`;

CREATE TABLE `t_anggota` (
  `kode_anggota` char(5) NOT NULL,
  `kode_tabungan` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat_anggota` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `telp` varchar(12) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  PRIMARY KEY (`kode_anggota`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_anggota` */

insert  into `t_anggota`(`kode_anggota`,`kode_tabungan`,`nama_anggota`,`alamat_anggota`,`jenis_kelamin`,`pekerjaan`,`tgl_masuk`,`telp`,`tempat_lahir`,`tgl_lahir`,`status`,`u_entry`,`tgl_entri`) values 
('A0001',31,'Rino Oktavianto','Baron','Laki-laki','Sepak Bola','2017-02-16','091','Nganjuk','2017-02-01','aktif','OKtavianto','2017-02-16'),
('A0002',32,'Siti Verida','Baron','Perempuan','Guru','2017-02-16','091','Nganjuk','2017-02-02','aktif','OKtavianto','2017-02-16'),
('A0003',0,'Veno','Baron','Laki-laki','Siswa','2017-02-16','091','Nganjuk','2017-02-03','keluar','OKtavianto','2017-02-16'),
('A0004',34,'Ronaldo Wati','jati','Laki-laki','sssssss','2017-02-20','111111111111','Medan','2017-01-31','aktif','OKtavianto','2017-02-20'),
('A0007',39,'Surabaya','asoooooy','Perempuan','asoooy','2017-02-21','0985','Nganjuk','2017-02-07','aktif','OKtavianto','2017-02-21'),
('A0006',0,'Mas Rino','nn','Laki-laki','jjjjj','2017-02-21','0000','Nganjuk','2017-02-10','keluar','OKtavianto','2017-02-21'),
('A0005',37,'kim hunj jong','x','Laki-laki','x','2017-02-21','x','ngnajuk','2017-02-17','aktif','OKtavianto','2017-02-21'),
('A0008',40,'rino','Nganjuk','Laki-laki','Ahli ','2017-02-21','123400099','Nganjuk','2017-02-14','keluar','OKtavianto','2017-02-21'),
('A0009',41,'Alhamdulillah','Nganjuk Raya','Laki-laki','Nelayan','2017-02-22','081330707048','Nganjuk','1996-06-14','aktif','OKtavianto','2017-02-22');

/*Table structure for table `t_angsur` */

DROP TABLE IF EXISTS `t_angsur`;

CREATE TABLE `t_angsur` (
  `kode_angsur` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pinjam` int(11) NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `sisa_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  PRIMARY KEY (`kode_angsur`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

/*Data for the table `t_angsur` */

insert  into `t_angsur`(`kode_angsur`,`kode_pinjam`,`angsuran_ke`,`besar_angsuran`,`denda`,`sisa_pinjam`,`kode_anggota`,`u_entry`,`tgl_entri`) values 
(120,50,1,27000,0,73000,'A0003','OKtavianto','2017-02-17'),
(119,49,1,270000,0,730000,'A0002','OKtavianto','2017-02-17'),
(118,48,1,540000,0,1460000,'A0001','OKtavianto','2017-02-17'),
(121,49,2,270000,0,460000,'A0002','OKtavianto','2017-02-18'),
(122,49,3,270000,0,190000,'A0002','OKtavianto','2017-02-18'),
(123,49,4,270000,0,-80000,'A0002','OKtavianto','2017-02-18'),
(124,51,1,135000,0,365000,'A0002','OKtavianto','2017-02-19'),
(125,50,2,27000,0,46000,'A0003','operator','2017-02-20'),
(126,51,2,135000,0,230000,'A0002','operator','2017-02-20'),
(127,48,2,540000,0,920000,'A0001','OKtavianto','2017-02-20'),
(128,48,3,540000,0,380000,'A0001','oktavianto','2017-02-20'),
(129,48,4,540000,0,-160000,'A0001','OKtavianto','2017-02-20'),
(130,51,3,135000,0,95000,'A0002','OKtavianto','2017-02-20'),
(131,51,4,135000,0,-40000,'A0002','OKtavianto','2017-02-20'),
(132,50,3,27000,0,19000,'A0003','OKtavianto','2017-02-20'),
(133,50,4,27000,0,-8000,'A0003','OKtavianto','2017-02-20'),
(135,52,1,33000,0,167000,'A0004','OKtavianto','2017-02-21'),
(144,54,1,270000,0,730000,'A0005','OKtavianto','2017-02-22'),
(139,52,2,33000,0,134000,'A0004','operator','2017-02-21'),
(145,57,1,27000,0,73000,'A0007','operator','2017-02-22');

/*Table structure for table `t_jenis_pinjam` */

DROP TABLE IF EXISTS `t_jenis_pinjam`;

CREATE TABLE `t_jenis_pinjam` (
  `kode_jenis_pinjam` char(5) NOT NULL,
  `nama_pinjaman` varchar(50) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `maks_pinjam` double NOT NULL,
  `bunga` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  PRIMARY KEY (`kode_jenis_pinjam`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_jenis_pinjam` */

insert  into `t_jenis_pinjam`(`kode_jenis_pinjam`,`nama_pinjaman`,`lama_angsuran`,`maks_pinjam`,`bunga`,`u_entry`,`tgl_entri`) values 
('P0001','biasa',4,2000000,2,'okta','2017-02-01'),
('P0002','Menengah',8,4000000,4,'','2017-03-09'),
('P0003','full',12,3000000,10,'OKtavianto','2017-03-26');

/*Table structure for table `t_jenis_simpan` */

DROP TABLE IF EXISTS `t_jenis_simpan`;

CREATE TABLE `t_jenis_simpan` (
  `kode_jenis_simpan` char(5) NOT NULL,
  `nama_simpanan` varchar(50) NOT NULL,
  `besar_simpanan` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  PRIMARY KEY (`kode_jenis_simpan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_jenis_simpan` */

insert  into `t_jenis_simpan`(`kode_jenis_simpan`,`nama_simpanan`,`besar_simpanan`,`u_entry`,`tgl_entri`) values 
('S0001','pokok',10000,'OKtavianto','2017-03-09'),
('S0002','wajib',70000,'OKtavianto','2017-04-08'),
('S0003','sukarela',0,'OKtavianto','2017-02-15');

/*Table structure for table `t_pengajuan` */

DROP TABLE IF EXISTS `t_pengajuan`;

CREATE TABLE `t_pengajuan` (
  `kode_pengajuan` int(4) NOT NULL AUTO_INCREMENT,
  `tgl_pengajuan` date NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_jenis_pinjam` varchar(10) NOT NULL,
  `besar_pinjam` int(11) NOT NULL,
  `tgl_acc` date NOT NULL,
  `status` varchar(12) NOT NULL,
  PRIMARY KEY (`kode_pengajuan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `t_pengajuan` */

insert  into `t_pengajuan`(`kode_pengajuan`,`tgl_pengajuan`,`kode_anggota`,`kode_jenis_pinjam`,`besar_pinjam`,`tgl_acc`,`status`) values 
(1,'2017-02-19','A0002','P0001',1000000,'0000-00-00','ditolak'),
(2,'2017-02-19','A0001','P0001',100000,'0000-00-00','ditolak');

/*Table structure for table `t_pengambilan` */

DROP TABLE IF EXISTS `t_pengambilan`;

CREATE TABLE `t_pengambilan` (
  `kode_ambil` int(5) NOT NULL AUTO_INCREMENT,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_tabungan` int(5) NOT NULL,
  `besar_ambil` int(20) NOT NULL,
  `tgl_ambil` date NOT NULL,
  PRIMARY KEY (`kode_ambil`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `t_pengambilan` */

insert  into `t_pengambilan`(`kode_ambil`,`kode_anggota`,`kode_tabungan`,`besar_ambil`,`tgl_ambil`) values 
(9,'A0001',31,50000,'2017-02-17'),
(10,'A0002',32,1000,'2017-02-17'),
(11,'A0002',32,50000,'2017-02-18'),
(14,'A0001',31,5000,'2017-02-20'),
(15,'A0001',31,4000,'2017-02-21'),
(18,'A0005',37,5000,'2017-02-21'),
(20,'A0007',39,10000,'2017-02-21'),
(21,'A0007',39,10000,'2017-02-21'),
(23,'A0008',0,10000,'2017-02-21');

/*Table structure for table `t_petugas` */

DROP TABLE IF EXISTS `t_petugas`;

CREATE TABLE `t_petugas` (
  `kode_petugas` char(5) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `alamat_petugas` varchar(100) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  PRIMARY KEY (`kode_petugas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_petugas` */

insert  into `t_petugas`(`kode_petugas`,`nama_petugas`,`alamat_petugas`,`no_telp`,`jenis_kelamin`,`u_entry`,`tgl_entri`) values 
('P0001','operator','Baron','0918','Laki-laki','OKtavianto','2017-02-16');

/*Table structure for table `t_pinjam` */

DROP TABLE IF EXISTS `t_pinjam`;

CREATE TABLE `t_pinjam` (
  `kode_pinjam` int(11) NOT NULL AUTO_INCREMENT,
  `kode_anggota` char(5) NOT NULL,
  `kode_jenis_pinjam` char(5) NOT NULL,
  `besar_pinjam` double NOT NULL,
  `besar_angsuran` double NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `sisa_angsuran` int(11) NOT NULL,
  `sisa_pinjaman` double NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  `tgl_tempo` date NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_pinjam`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*Data for the table `t_pinjam` */

insert  into `t_pinjam`(`kode_pinjam`,`kode_anggota`,`kode_jenis_pinjam`,`besar_pinjam`,`besar_angsuran`,`lama_angsuran`,`sisa_angsuran`,`sisa_pinjaman`,`u_entry`,`tgl_entri`,`tgl_tempo`,`status`) values 
(48,'A0001','P0001',2000000,540000,4,4,-160000,'OKtavianto','2017-02-16','2017-06-16','lunas'),
(49,'A0002','P0001',1000000,270000,4,4,-80000,'OKtavianto','2017-02-17','2017-06-17','lunas'),
(50,'A0003','P0001',100000,27000,4,4,-8000,'OKtavianto','2017-02-17','2017-06-17','lunas'),
(51,'A0002','P0001',500000,135000,4,4,-40000,'OKtavianto','2017-02-18','2017-06-18','lunas'),
(52,'A0004','P0002',200000,33000,8,2,134000,'OKtavianto','2017-02-20','2017-05-21','belum lunas'),
(54,'A0005','P0001',1000000,270000,4,1,730000,'operator','2017-02-21','2017-04-22','belum lunas'),
(57,'A0007','P0001',100000,27000,4,1,73000,'OKtavianto','2017-02-22','2017-04-23','belum lunas');

/*Table structure for table `t_simpan` */

DROP TABLE IF EXISTS `t_simpan`;

CREATE TABLE `t_simpan` (
  `kode_simpan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_simpan` varchar(10) NOT NULL,
  `besar_simpanan` double NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_entri` date NOT NULL,
  PRIMARY KEY (`kode_simpan`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

/*Data for the table `t_simpan` */

insert  into `t_simpan`(`kode_simpan`,`jenis_simpan`,`besar_simpanan`,`kode_anggota`,`u_entry`,`tgl_mulai`,`tgl_entri`) values 
(130,'wajib',70000,'A0001','OKtavianto','2017-02-23','2017-02-16'),
(129,'pokok',10000,'A0003','OKtavianto','2017-02-16','2017-02-16'),
(128,'pokok',10000,'A0002','OKtavianto','2017-02-16','2017-02-16'),
(127,'pokok',10000,'A0001','OKtavianto','2017-02-16','2017-02-16'),
(131,'sukarela',100000,'A0001','OKtavianto','2017-02-17','2017-02-17'),
(132,'wajib',70000,'A0003','OKtavianto','2017-02-24','2017-02-17'),
(133,'wajib',70000,'A0002','OKtavianto','2017-02-24','2017-02-17'),
(134,'sukarela',1000,'A0002','OKtavianto','2017-02-17','2017-02-17'),
(135,'sukarela',10000,'A0002','OKtavianto','2017-02-18','2017-02-18'),
(136,'sukarela',5000,'A0001','OKtavianto','2017-02-18','2017-02-18'),
(137,'pokok',10000,'A0004','OKtavianto','2017-02-20','2017-02-20'),
(138,'wajib',70000,'A0004','OKtavianto','2017-02-27','2017-02-20'),
(145,'sukarela',1000000,'A0001','OKtavianto','2017-02-21','2017-02-21'),
(141,'sukarela',1000000,'A0001','operator','2017-02-21','2017-02-21'),
(144,'pokok',10000,'A0005','OKtavianto','2017-02-21','2017-02-21'),
(146,'pokok',10000,'A0006','OKtavianto','2017-02-21','2017-02-21'),
(147,'sukarela',1000000,'A0006','OKtavianto','2017-02-21','2017-02-21'),
(148,'wajib',70000,'A0006','OKtavianto','2017-02-28','2017-02-21'),
(149,'pokok',10000,'A0007','OKtavianto','2017-02-21','2017-02-21'),
(150,'sukarela',500000,'A0007','operator','2017-02-21','2017-02-21'),
(151,'pokok',10000,'A0008','OKtavianto','2017-02-21','2017-02-21'),
(152,'wajib',70000,'A0001','OKtavianto','2017-03-02','2017-02-23'),
(153,'wajib',70000,'A0001','OKtavianto','2017-03-09','2017-03-26'),
(154,'wajib',70000,'A0007','OKtavianto','2017-02-28','2017-02-21'),
(155,'pokok',10000,'A0009','OKtavianto','2017-02-22','2017-02-22'),
(156,'sukarela',50000,'A0009','OKtavianto','2017-02-22','2017-02-22');

/*Table structure for table `t_tabungan` */

DROP TABLE IF EXISTS `t_tabungan`;

CREATE TABLE `t_tabungan` (
  `kode_tabungan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_anggota` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `besar_tabungan` double NOT NULL,
  PRIMARY KEY (`kode_tabungan`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `t_tabungan` */

insert  into `t_tabungan`(`kode_tabungan`,`kode_anggota`,`tgl_mulai`,`besar_tabungan`) values 
(32,'A0002','2017-02-16',40000),
(31,'A0001','2017-02-16',2266000),
(39,'A0007','2017-02-21',470000),
(34,'A0004','2017-02-20',80000),
(37,'A0005','2017-02-21',5000),
(41,'A0009','2017-02-22',60000);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `kode_user` char(5) NOT NULL,
  `kode_petugas` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `tgl_entri` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` char(10) NOT NULL,
  PRIMARY KEY (`kode_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_user` */

insert  into `t_user`(`kode_user`,`kode_petugas`,`username`,`password`,`nama`,`tgl_entri`,`foto`,`level`) values 
('U0001','','rino','rino','oktavianto','2017-02-15','I-love-you-hearts.PNG','operator'),
('U0002','','admin','admin','OKtavianto','2017-02-15','dd.jpg','admin'),
('U0003','P0001','operator','operator','operator','2017-02-16','OKtavianto','operator');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
