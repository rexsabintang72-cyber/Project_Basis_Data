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
