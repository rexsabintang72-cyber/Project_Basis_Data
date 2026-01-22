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
