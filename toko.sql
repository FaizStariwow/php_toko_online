CREATE DATABASE `toko_online`;

CREATE TABLE `kategori_produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) 

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `pembayaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_produk_id` int NOT NULL,
  `nama` varchar(200) NOT NULL,
  `harga` int NOT NULL,
  `deskripsi` text NOT NULL,
  `foto_produk` varchar(200) NOT NULL,
  `stok_produk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori_produk_id` (`kategori_produk_id`),
  CONSTRAINT `FK_kategori` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `keranjang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `produk_id` int NOT NULL,
  `jumlah` int NOT NULL,
  `total_harga` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `produk_id` (`produk_id`),
  CONSTRAINT `FK_keranjang_produk` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_keranjang_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `transaksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `produk_id` int NOT NULL,
  `pembayaran_id` int NOT NULL,
  `alamat_pengiriman` varchar(200) NOT NULL,
  `total_harga` int NOT NULL,
  `jumlah` int NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pembayaran_id` (`pembayaran_id`),
  KEY `user_id` (`user_id`),
  KEY `produk_id` (`produk_id`),
  CONSTRAINT `FK_transaksi_pembayaran` FOREIGN KEY (`pembayaran_id`) REFERENCES `pembayaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_transaksi_produk` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_transaksi_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;


CREATE TABLE `ulasan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produk_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ulasan` varchar(200) NOT NULL,
  `rating` int NOT NULL,
  `foto_ulasan` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produk_id` (`produk_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_produk` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

