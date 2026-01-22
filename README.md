# Perancangan Basis Data Administrasi Belanja Menggunakan Entity Relationship Diagram (ERD)

## 1. Pendahuluan
Perkembangan teknologi informasi mendorong kebutuhan akan sistem pengelolaan data yang cepat, akurat, dan terstruktur. Dalam kegiatan administrasi belanja, pengelolaan data secara manual berpotensi menimbulkan berbagai permasalahan seperti kesalahan pencatatan, duplikasi data, serta kesulitan dalam penyusunan laporan.

Oleh karena itu, diperlukan sebuah perancangan basis data yang baik dan terstruktur. Proyek ini berfokus pada perancangan basis data administrasi belanja dengan menggunakan **Entity Relationship Diagram (ERD)** sebagai alat bantu untuk memodelkan data dan hubungan antar data sebelum diimplementasikan ke dalam sistem basis data.

## 2. Tujuan Perancangan
Tujuan utama dari perancangan basis data administrasi belanja ini adalah:
- Mengelola data belanja secara terstruktur dan sistematis.
- Mengurangi kesalahan pencatatan dan duplikasi data.
- Meningkatkan efisiensi proses administrasi belanja.
- Mempermudah pencarian data dan pembuatan laporan.
- Memberikan gambaran hubungan antar data melalui ERD agar mudah dipahami.

## 3. Gambaran Umum Sistem
Sistem administrasi belanja ini dirancang untuk menangani proses:
- Pencatatan data pelanggan.
- Pencatatan data supplier.
- Pengelolaan data barang.
- Pencatatan transaksi belanja.
- Penyimpanan detail barang pada setiap transaksi.

Seluruh data saling terhubung melalui relasi antar tabel sehingga informasi dapat disajikan secara lengkap dan konsisten.

## 4. Entity Relationship Diagram (ERD)
Entity Relationship Diagram (ERD) digunakan untuk menggambarkan:
- Entitas yang terlibat dalam sistem.
- Atribut yang dimiliki oleh setiap entitas.
- Relasi antar entitas.

Dengan adanya ERD, perancangan basis data menjadi lebih terstruktur dan mudah dikembangkan ke tahap implementasi.

## 5. Relasi Tabel dalam Basis Data
Relasi tabel berfungsi untuk menghubungkan data antar entitas. Dalam sistem ini, relasi digunakan untuk menyimpan data transaksi yang dilakukan oleh pelanggan dan detail barang yang dibeli.

### 5.1 Daftar Tabel
Tabel-tabel yang digunakan dalam basis data ini meliputi:
1. **Tabel Pelanggan**  
   Menyimpan data pelanggan seperti nama dan alamat.

2. **Tabel Supplier**  
   Menyimpan data pemasok barang.

3. **Tabel Barang**  
   Menyimpan informasi barang yang dijual.

4. **Tabel Transaksi**  
   Menyimpan data transaksi belanja.

5. **Tabel Detail_Transaksi**  
   Menyimpan detail barang yang dibeli pada setiap transaksi.

## 6. Normalisasi Basis Data
Normalisasi merupakan proses pengelompokan atribut data ke dalam tabel-tabel untuk menghindari redundansi dan anomali data.

### 6.1 Bentuk Normal
- **First Normal Form (1NF)**  
  Setiap atribut memiliki nilai tunggal dan tidak terdapat data berulang.

- **Second Normal Form (2NF)**  
  Tabel telah memenuhi 1NF dan setiap atribut non-kunci bergantung sepenuhnya pada primary key, sehingga tidak terdapat ketergantungan parsial.

Penerapan normalisasi ini membuat basis data lebih efisien dan konsisten.

## 7. Implementasi Structured Query Language (SQL)
Implementasi basis data dilakukan menggunakan **Structured Query Language (SQL)**. Beberapa konsep penting yang digunakan antara lain:
- `CREATE TABLE` untuk membuat tabel.
- **PRIMARY KEY** sebagai identitas unik setiap data.
- **FOREIGN KEY** untuk merepresentasikan relasi antar tabel.
- Penggunaan **InnoDB** sebagai engine untuk mendukung integritas referensial.

## 8. Manfaat Sistem
Manfaat dari perancangan basis data administrasi belanja ini antara lain:
- Data tersimpan dengan rapi dan terstruktur.
- Mengurangi kesalahan pencatatan data.
- Memudahkan proses pencarian dan pengolahan data.
- Mendukung pembuatan laporan administrasi belanja.
- Sistem mudah dikembangkan di masa mendatang.

## 9. Kesimpulan
Perancangan basis data administrasi belanja menggunakan ERD memberikan gambaran yang jelas mengenai struktur data dan hubungan antar data. Dengan basis data yang terstruktur dan ternormalisasi, sistem administrasi belanja dapat berjalan lebih efektif, efisien, dan akurat.

## 10. Penyusun
Proyek ini disusun oleh:
- **Dhiannikha Wahyu Nur Hidayat** (240103187)  
- **Bintang Fajar Mustika Aji** (240103186)  
- **Nige Lastara** (240103198)
