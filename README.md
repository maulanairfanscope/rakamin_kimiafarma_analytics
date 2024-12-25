Deskripsi
SQL ini dirancang untuk menganalisis data transaksi dari Kimia Farma. Skrip ini menggabungkan informasi dari beberapa tabel untuk memberikan wawasan mendalam tentang transaksi yang terjadi di berbagai cabang. Data yang diambil mencakup detail transaksi, informasi cabang, produk yang dijual, serta perhitungan laba bersih dan penjualan bersih setelah diskon.

Tabel yang Digunakan
1. kimia_farma.kf_final_transaction (ft): Tabel ini menyimpan data transaksi final, termasuk ID transaksi, tanggal, ID cabang, nama pelanggan, ID produk, dan rating transaksi.
2. kimia_farma.kf_kantor_cabang (kc): Tabel ini berisi informasi tentang cabang, termasuk ID cabang, nama cabang, kota, provinsi, dan rating cabang.
3. kimia_farma.kf_product (p): Tabel ini menyimpan detail produk, termasuk ID produk, nama produk, dan harga asli produk.

Fitur Utama
- Penghitungan Laba Bersih: Skrip ini menghitung laba bersih berdasarkan persentase gross laba yang ditentukan oleh rentang harga produk.
- Penjualan Bersih: Menghitung penjualan bersih setelah menerapkan diskon pada harga produk.
- Informasi Cabang: Menyediakan detail tentang cabang tempat transaksi terjadi, termasuk nama cabang, kota, dan provinsi.
- Rating: Menyertakan rating untuk cabang dan transaksi, memberikan gambaran tentang performa masing-masing.

Struktur Query
Query ini melakukan operasi JOIN antara tiga tabel untuk menggabungkan informasi yang relevan, dan menggunakan CASE untuk menentukan persentase gross laba berdasarkan harga produk. Hasil akhir mencakup kolom-kolom penting yang memberikan gambaran menyeluruh tentang transaksi.

Hasil Analisa
Anda dapat melihat dashboard analisa data pada url berikut:
https://lookerstudio.google.com/reporting/599a0d10-6a88-4329-9f54-b7d0dafd8799
