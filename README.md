# Anggota Kelompok
2506584893 - Andranu Dhawy Purditya

2506592125 - Nathanael Orrick Hatmoko

2506612814 - Samuel Haganta Surbakti

2506618881 - Muhammad Fachri Novelino

2506656936 - Kusuma Putra Abdillah Adhimaya

# Deskripsi Aplikasi:
CALOREAT adalah aplikasi pemantau nutrisi dan kalkulator kalori harian berbasis Flutter yang menghadirkan pengalaman pengelolaan pola makan sehat langsung dari perangkat mobile. Aplikasi ini membantu pengguna mencatat asupan kalori (calorie intake) dan makronutrisi (karbohidrat, protein, dan lemak) secara cepat dan praktis, sekaligus menjaga konsistensi harian melalui target kalori personal dan pencatatan streak.

Mengusung prinsip Sustainable Living, CALOREAT Mobile tidak hanya berfokus pada kesehatan personal, tetapi juga mendorong kebiasaan konsumsi yang lebih bijak dan ramah lingkungan—termasuk pemahaman dampak lingkungan  serta pencegahan food waste. Melalui integrasi Food Catalog, Calorie Tracker, Portion Guide berbasis panduan Isi Piringku, pengguna dapat mengatur takaran porsi makan yang ideal sesuai kebutuhan gizi tanpa pembelian berlebih, kapan saja dan di mana saja.

# Tautan Penting
- Link Figma : https://www.figma.com/design/URF88q06htUJHL5Ft8GSpO/Caloreat-Mobile?node-id=0-1&t=6lXdprLIPiPiZoZx-1

# Daftar Modul

- Halaman Autentikasi, Profil dan Admin Portal: Halaman login, register, profil pengguna, dan admin portal untuk mengelola pengguna serta basis data makanan. (Samuel Haganta Surbakti)

- Homepage, AppBar & Navigation Bar: Halaman utama yang menampilkan ringkasan kalori dan makronutrisi harian, daily streak, pencarian cepat makanan, catatan makan, edukasi singkat pola makan sehat, halaman Reviews dari pengguna, serta AppBar dan navigation bar untuk navigasi aplikasi. (Andranu Dhawy Purditya)

- Kalkulator & Pelacak Kalori: Pengguna dapat menghitung kebutuhan kalori harian (BMR/TDEE) serta mencatat asupan makanan harian secara teratur. (Nathanael Orrick Hatmoko)

- Katalog Nutrisi Makanan: Menyajikan daftar bahan dan menu makanan beserta detail informasi kandungan gizi sehat seperti makronutrisi (protein, karbohidrat, lemak) dan mikronutrisi (vitamin, mineral). (Muhammad Fachri Novelino)

- Panduan Porsi Makan Sehat: Menyajikan panduan takaran dan ukuran porsi makanan yang ideal untuk dikonsumsi harian sesuai kebutuhan gizi pengguna. (Kusuma Putra Abdillah Adhimaya)

# Peran Pengguna Aplikasi

- Guest User

Dapat mengakses halaman Home, mencari dan menelusuri informasi gizi pada Food Catalog, melihat referensi takaran porsi pada Portion Guide, serta membaca dan memfilter ulasan pengguna di halaman Reviews (read-only).
Dapat melakukan pendaftaran akun baru atau masuk ke akun yang sudah ada.

- Authenticated User

Memiliki seluruh akses Guest disertai fitur personal yang tersinkronisasi dengan akun pada server PWS.
Dapat melengkapi dan mengubah Profile, memantau ringkasan kalori, makronutrisi, dan daily streak di Home, mencatat serta mengelola asupan makan harian di Calorie Tracker, menggunakan Portion Guide, serta menambahkan, mengedit, menghapus, dan memfilter ulasan miliknya sendiri pada halaman Reviews.

- Superuser

Bertanggung jawab atas pengelolaan konten dan moderasi data pada ekosistem CALOREAT. Dapat menambah, mengubah, dan menghapus konten pada Portion Guide serta mengelola data katalog nutrisi, sekaligus memoderasi halaman Reviews dengan menghapus ulasan dari pengguna lain.

# Alur Pengintegrasian Data
Aplikasi CALOREAT Mobile terintegrasi dengan situs web CALOREAT yang di-deploy pada PWS (https://muhammad-fachri54-caloreat.pws.cs.ui.ac.id) melalui web service berbasis Django REST Framework (DRF). Komunikasi antara client Flutter dan backend Django berlangsung melalui protokol HTTP dengan pertukaran data berformat JSON, sehingga aplikasi mobile dan web berbagi satu basis data yang sama.

Saat pengguna berinteraksi di aplikasi mobile, Flutter mengirimkan request GET untuk mengambil data atau POST/PUT/PATCH/DELETE untuk mengirim perubahan data beserta sesi autentikasi. Di sisi backend, DRF memvalidasi request menggunakan serializer dan memeriksa hak akses melalui permission sebelum memproses data pada basis data, lalu mengembalikan respons JSON yang di-parse oleh Flutter ke dalam model Dart untuk ditampilkan ke UI.