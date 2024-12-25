SELECT
  ft.transaction_id, -- ID unik untuk setiap transaksi.
  ft.date, -- Tanggal transaksi.
  ft.branch_id, -- ID cabang tempat transaksi terjadi.
  kc.branch_name, -- Nama cabang terkait.
  kc.kota, -- Kota tempat cabang berada.
  kc.provinsi, -- Provinsi tempat cabang berada.
  kc.rating AS rating_cabang, -- Rating cabang berdasarkan performa.
  ft.customer_name, -- Nama pelanggan.
  ft.product_id, -- ID produk yang dibeli.
  p.product_name, -- Nama produk.
  p.price AS actual_price, -- Harga asli produk sebelum diskon.
  ft.discount_percentage, -- Persentase diskon pada transaksi.
  CASE
    WHEN p.price <= 50000 THEN 0.1 -- Gross laba 10% jika harga produk ≤ 50.000.
    WHEN p.price BETWEEN 50000 AND 100000 THEN 0.15 -- Gross laba 15% untuk harga 50.000 - 100.000.
    WHEN p.price BETWEEN 100000 AND 300000 THEN 0.2 -- Gross laba 20% untuk harga 100.000 - 300.000.
    WHEN p.price BETWEEN 300000 AND 500000 THEN 0.25 -- Gross laba 25% untuk harga 300.000 - 500.000.
    ELSE 0.3 -- Gross laba 30% untuk harga > 500.000.
  END AS persentase_gross_laba, -- Persentase gross laba berdasarkan harga produk.
  (p.price * (1-ft.discount_percentage)) AS nett_sales, -- Penjualan bersih setelah diskon.
  (p.price * (CASE
        WHEN p.price <= 50000 THEN 0.1
        WHEN p.price BETWEEN 50000 AND 100000 THEN 0.15
        WHEN p.price BETWEEN 100000 AND 300000 THEN 0.2
        WHEN p.price BETWEEN 300000 AND 500000 THEN 0.25
        ELSE 0.3
    END)) AS nett_profit, -- Laba bersih berdasarkan persentase gross laba.
  ft.rating AS rating_transaksi -- Rating transaksi.
FROM
  kimia_farma.kf_final_transaction AS ft -- Tabel transaksi final.
JOIN
  kimia_farma.kf_kantor_cabang AS kc -- Tabel kantor cabang untuk detail lokasi.
ON
  ft.branch_id = kc.branch_id
JOIN
  kimia_farma.kf_product AS p -- Tabel produk untuk detail produk.
ON
  ft.product_id = p.product_id;
