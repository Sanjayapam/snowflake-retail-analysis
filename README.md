# 🛒 Retail Sales Performance & Double Pareto Analysis (Snowflake SQL)

## Deskripsi Proyek
Proyek ini bertujuan untuk menganalisis performa penjualan ritel berskala besar menggunakan dataset dari **Corporación Favorita**. Analisis difokuskan pada identifikasi kontributor utama pendapatan menggunakan **Prinsip Pareto (80/20)**, efisiensi operasional melalui normalisasi KPI, dan pola perilaku konsumen berdasarkan tren waktu.

Analisis dilakukan sepenuhnya menggunakan **Snowflake SQL**, mencakup pengolahan jutaan baris data transaksi untuk menghasilkan wawasan yang dapat ditindaklanjuti (*actionable insights*).

---

## Metodologi Analisis

Proyek ini dibagi menjadi 4 tahapan strategis:

### 1. Rank Toko Berdasarkan sales
Bukan sekadar melihat total penjualan, tahap ini menghitung efisiensi harian toko menggunakan tiga metrik utama:
* **Produktivitas:** Penjualan per hari aktif.
* **Traffic:** Jumlah transaksi per hari.
* **Basket Size:** Rata-rata nilai belanja per transaksi.
  
### 2. Normalisasi KPI & Efisiensi Toko
Bukan sekadar melihat total penjualan, tahap ini menghitung efisiensi harian toko menggunakan tiga metrik utama:
* **Produktivitas:** Penjualan per hari aktif.
* **Traffic:** Jumlah transaksi per hari.
* **Basket Size:** Rata-rata nilai belanja per transaksi.

### 3. Pareto Analysis (Top 80% Stores)
Mengidentifikasi toko mana yang menjadi "tulang punggung" perusahaan. 
* **Temuan:** Sekitar 57% toko (31 dari 54) menyumbang 80% dari total pendapatan perusahaan.

### 4. Double Pareto Analysis (Top 80% Families)
Menganalisis kategori produk (*Family*) yang paling dominan di dalam toko-toko performa tinggi (Top 80% Stores).
* **The Big Five:** Grocery I, Beverages, Produce, Cleaning, dan Dairy menguasai hampir 80% omzet di toko-toko elit.

### 5. Temporal & Seasonality Analysis
Menganalisis pola belanja harian untuk mengoptimalkan operasional logistik dan stok.

---

## Key Insights (Temuan Utama)

* **Dominasi Wilayah:** Kota **Quito** mendominasi peringkat 7 besar toko dengan penjualan tertinggi, namun toko di **Guayaquil** menunjukkan *Basket Size* yang lebih kompetitif.
* **Strategi "Wednesday Fresh":** Khusus kategori **PRODUCE**, puncak penjualan terjadi pada hari **Rabu (17.96%)**, melampaui akhir pekan. Hal ini mengindikasikan keberhasilan kampanye "Hari Segar" di tengah minggu.
* **Weekend Surge:** Kategori **BEVERAGES** sangat sensitif terhadap akhir pekan, dengan kontribusi mencapai **20%** hanya di hari Minggu.
* **Kamis Tersepi:** Hari Kamis secara konsisten menjadi titik terendah aktivitas belanja di semua kategori produk, yang dapat dimanfaatkan untuk pemeliharaan toko atau restock besar.

---

##  Tech Stack
* **Database:** Snowflake
* **Language:** SQL (Window Functions, CTEs, Aggregate Functions, Temporal Data Handling)

---

## 📂 Struktur Folder
```text
├── scripts/
│   ├── 01_store_efficiency_kpi.sql
│   ├── 02_pareto_store_analysis.sql
│   ├── 03_double_pareto_product_family.sql
│   └── 04_daily_temporal_trends.sql
└── README.md
