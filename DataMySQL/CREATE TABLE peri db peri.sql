DROP TABLE IF EXISTS `peri`.`peri_kat`;
CREATE TABLE  `peri`.`peri_kat` (
  `kode` char(6) DEFAULT NULL,
  `nama` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_location`;
CREATE TABLE  `peri`.`peri_location` (
  `location` char(6) DEFAULT NULL,
  `nama` char(60) DEFAULT NULL,
  `nick` char(5) DEFAULT NULL,
  `cabang` char(3) DEFAULT NULL,
  `am` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_master`;
CREATE TABLE  `peri`.`peri_master` (
  `isbn` char(24) DEFAULT NULL,
  `kdbrg` char(6) DEFAULT NULL,
  `judul` char(60) DEFAULT NULL,
  `kategori` char(4) DEFAULT NULL,
  `author` char(40) DEFAULT NULL,
  `publisher` char(6) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `sgroup` char(1) DEFAULT NULL,
  `kelas` char(2) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_onorder`;
CREATE TABLE  `peri`.`peri_onorder` (
  `isbn` char(24) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_proses`;
CREATE TABLE  `peri`.`peri_proses` (
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_pub`;
CREATE TABLE  `peri`.`peri_pub` (
  `kode` char(6) DEFAULT NULL,
  `nama` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_stock`;
CREATE TABLE  `peri`.`peri_stock` (
  `location` char(6) DEFAULT NULL,
  `isbn` char(24) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `binloc` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `peri`.`peri_user`;
CREATE TABLE  `peri`.`peri_user` (
  `userid` varchar(25) DEFAULT NULL,
  `useremail` varchar(50) DEFAULT NULL,
  `userpassword` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;