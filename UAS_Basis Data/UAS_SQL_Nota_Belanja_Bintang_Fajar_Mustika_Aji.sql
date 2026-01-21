-- =====================================================
-- FINAL PROJECT UAS PEMROGRAMAN BASIS DATA
-- Studi Kasus : Sistem Penjualan
-- DBMS        : MySQL
-- =====================================================

/* =====================
   DATABASE
   ===================== */
CREATE DATABASE IF NOT EXISTS toko_db;
USE toko_db;

/* =====================
   DROP TABLE (AMAN RE-RUN)
   ===================== */
DROP TABLE IF EXISTS detail_transaksi;
DROP TABLE IF EXISTS transaksi;
DROP TABLE IF EXISTS barang;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS pelanggan;

/* =====================
   DDL (CREATE TABLE)
   ===================== */
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
    FOREIGN KEY (id_supplier)
        REFERENCES supplier(id_supplier)
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
    FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan(id_pelanggan)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE detail_transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_barang INT NOT NULL,
    jumlah INT NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_transaksi)
        REFERENCES transaksi(id_transaksi)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (id_barang)
        REFERENCES barang(id_barang)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

/* =====================
   DML (INSERT DATA)
   ===================== */
INSERT INTO pelanggan VALUES
(NULL,'Bintang','Surakarta'),
(NULL,'Andi','Yogyakarta'),
(NULL,'Rina','Solo');

INSERT INTO supplier VALUES
(NULL,'PT Sumber Makmur','Semarang','08123456789');

INSERT INTO barang VALUES
(NULL,'Buku Tulis','pcs',10000,1),
(NULL,'Pulpen','pcs',5000,1),
(NULL,'Penghapus','pcs',3000,1);

INSERT INTO transaksi VALUES
(NULL,1,20000,20000,'NT001','2025-01-10'),
(NULL,2,15000,20000,'NT002','2025-01-11');

INSERT INTO detail_transaksi VALUES
(NULL,1,1,1,10000),
(NULL,1,2,2,10000),
(NULL,2,2,1,5000),
(NULL,2,3,2,6000);

/* =====================================================
   QUERY JOIN
   ===================================================== */
SELECT 
    p.nama_pelanggan,
    t.nomor_nota,
    t.tanggal_transaksi,
    b.nama_barang,
    d.jumlah,
    d.subtotal
FROM detail_transaksi d
JOIN transaksi t ON d.id_transaksi = t.id_transaksi
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN barang b ON d.id_barang = b.id_barang;

/* =====================================================
   AGREGASI + GROUP BY
   ===================================================== */
SELECT 
    b.nama_barang,
    SUM(d.jumlah) AS total_terjual,
    SUM(d.subtotal) AS total_pendapatan
FROM detail_transaksi d
JOIN barang b ON d.id_barang = b.id_barang
GROUP BY b.nama_barang;

/* =====================================================
   AGREGASI + GROUP BY + HAVING
   ===================================================== */
SELECT 
    b.nama_barang,
    SUM(d.jumlah) AS total_terjual
FROM detail_transaksi d
JOIN barang b ON d.id_barang = b.id_barang
GROUP BY b.nama_barang
HAVING SUM(d.jumlah) > 1;

/* =====================================================
   SUBQUERY
   ===================================================== */
SELECT 
    nama_barang,
    harga_satuan
FROM barang
WHERE harga_satuan > (
    SELECT AVG(harga_satuan)
    FROM barang
);

/* =====================================================
   SUBQUERY (PELANGGAN PERNAH TRANSAKSI)
   ===================================================== */
SELECT 
    nama_pelanggan
FROM pelanggan
WHERE id_pelanggan IN (
    SELECT id_pelanggan
    FROM transaksi
);

/* =====================================================
   VIEW
   ===================================================== */
CREATE VIEW view_laporan_penjualan AS
SELECT 
    p.nama_pelanggan,
    t.nomor_nota,
    t.tanggal_transaksi,
    b.nama_barang,
    d.jumlah,
    d.subtotal
FROM detail_transaksi d
JOIN transaksi t ON d.id_transaksi = t.id_transaksi
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN barang b ON d.id_barang = b.id_barang;

/* Panggil VIEW */
SELECT * FROM view_laporan_penjualan;

/* =====================================================
   TCL (TRANSACTION CONTROL)
   ===================================================== */
START TRANSACTION;
INSERT INTO pelanggan VALUES (NULL,'Doni','Klaten');
ROLLBACK;
