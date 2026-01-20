
CREATE DATABASE IF NOT EXISTS toko_db;
USE toko_db;

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    alamat_pelanggan TEXT
) ENGINE=InnoDB;

CREATE TABLE supplier (
    id_supplier INT AUTO_INCREMENT PRIMARY KEY,
    nama_supplier VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    satuan VARCHAR(50),
    harga_satuan DECIMAL(12,2) NOT NULL,
    id_supplier INT,
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
        ON UPDATE CASCADE
        ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT NOT NULL,
    total DECIMAL(12,2),
    bayar DECIMAL(12,2),
    nomor_nota VARCHAR(50),
    tanggal_transaksi DATE,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE detail_transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_barang INT NOT NULL,
    jumlah INT NOT NULL,
    subtotal DECIMAL(12,2),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;
