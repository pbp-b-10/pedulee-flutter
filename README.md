[![Build status](https://build.appcenter.ms/v0.1/apps/c5a293b8-a19c-4243-b916-2e50c218c805/branches/main/badge)](https://appcenter.ms)

# PEDULEE - B10
Ghayda Rafa Hernawan - 2106634332 <br />
Daffa Muhammad Faizan - 2106704156 <br />
Rakhan Yusuf Rivesa - 2106751852 <br />
Alvin Widi Nugroho - 2106751902 <br />
Marietha Asnat Nauli Sitompul - 2106752413 <br />

## CERITA APLIKASI
Pedulee adalah sebuah platform yang menerima donasi dalam berbagai bentuk, yaitu pakaian bekas layak pakai, dana atau uang, donor darah, serta sembako yang nantinya akan diberikan kepada korban bencana dari proyek yang sedang berjalan. Selain itu, platform Pedulee juga menyalurkan sukarelawan ke berbagai kegiatan atau proyek yang dapat diakses pada fitur _volunteering_. Penerimaan donasi dan kegiatan sukarela ini dilaksanakan untuk membantu isu-isu kemanusiaan yang berkaitan dengan G20. Donasi pakaian bekas layak pakai berkaitan dengan isu _Climate Sustainability and Energy_; donasi uang dan sembako berkaitan dengan isu _Agriculture and Food Security_; donor darah berkaitan dengan isu Global Health; dan _volunteering_ berkaitan dengan isu _Strong, Sustainable, Balanced and Inclusive Growth_. <br />

#### [🔗 Link Website Pedulee](https://pedulee.up.railway.app/) <br />

#### [🔗 Link Download APK](https://github.com/pbp-b-10/pedulee-mobile/releases/download/1.5.9%2B1/app.apk) <br />

## ROLE PENGGUNA
**a. Guest user** <br />
- Mengunjungi dan mengakses fitur pada Main Page <br />
- Mengunjungi Register dan Sign in Page <br />
- Melihat dan mengunjungi modul Daftar Proyek <br />

**b. Logged in user** <br />
- Mengunjungi dan mengakses fitur pada Main Page <br />
- Mengunjungi Reigster dan Sign in Page <br />
- Melihat dan mengunjungi modul Daftar Proyek <br />
- Mengakses dan mengedit bagian Profile user <br />
- Memberikan donasi berupa pakaian bekas layak pakai, dana atau uang, sembako, dan donor darah <br />
- Mendaftar menjadi volunteer untuk suatu proyek yang sedang berlangsung <br />

## ROLE ADMIN
- Menampilkan informasi-informasi terkait fitur-fitur yang terdapat pada aplikasi kepada user dengan tampilan ui/ux yang mudah dimengerti dan digunakan <br />
- Mengolah data-data yang dimasukkan oleh user ke dalam formulir-formulir yang terdapat pada fitur-fitur aplikasi. Data-data yang ada dapat dimunculkan dan ditampilkan sebagai informasi kepada pengguna sebagai progress perjalanan donasi dan bantuan kemanusiaan kepada yang membutuhkan <br />
- Memvalidasi proyek baru yang didaftarkan oleh user <br />

## DAFTAR MODUL (Fitur)
**1. Main Page (Halaman Utama) (Alvin & Daffa)** <br />
Modul ini merupakan tampilan pertama yang akan dilihat oleh user saat membuka website (aplikasi) Pedulee. Pada modul ini, user dapat melihat semua modul yang tertera pada website, tetapi tidak semua modul dapat diakses oleh user yang belum login ke dalam website. Modul ini juga menampilkan informasi mengenai berita - berita isu G20 yang sedang terjadi, proyek - proyek yang sedang berjalan, sebuah carousel yang dapat mendirect user menuju link berita isu G20 atau proyek yang sedang berjalan. <br />

**2. Register + Login (Rafa)** <br />
Modul ini digunakan untuk mengindentifikasi user pada website.Modul ini akan meminta user untuk memberikan username dan password yang telah didaftarkan sebelumnya pada modul register. Modul Register akan mewajibkan calon user untuk mengisi beberapa informasi saja seperti nama, alamat, alamat email, nomor telepon, dan tanggal lahir. Informasi lebih lengkap dapat diisi oleh user lebih lanjut pada modul Profile. <br />

**3. Daftar Proyek (Asnat)** <br />
Modul ini akan menampilkan daftar proyek - proyek donasi yang sedang berjalan. Pada setiap proyek, akan ditampilkan informasi singkat mengenai proyek tersebut, link berita terkait proyek tersebut, jumlah donasi yang sudah diterima oleh tim Pedulee untuk proyek tersebut, dan durasi waktu berlangsungnya proyek tersebut.<br />

**4. Form Profile (Rakhan)** <br />
Modul ini digunakan oleh user yang telah login untuk memodifikasi data profil milik user tersebut. Data yang dapat diubah adalah nama, deskripsi diri, dan menambahkan foto profil. Selain itu, kita dapat menambahkan identitas lebih spesifik. <br />

**5. Form Donasi Pakaian Bekas Layak Pakai (Rafa)** <br />
Modul ini digunakan oleh user yang telah login untuk mendonasikan pakaian bekas layak pakai yang mereka miliki. Pada modul ini, jenis pakaian yang akan di donasikan dapat dispesifikan berdasarkan jenis, pengguna (jenis kelamin), dan bahan pakaian tersebut. <br />

**6. Form Donasi Dana atau Uang (Daffa)** <br />
Modul ini digunakan oleh user yang telah login untuk berdonasi dalam bentuk uang ke proyek yang dipilih. Fitur yang dimiliki oleh modul ini adalah nama, nominal uang, dan pesan donasi. Setelah itu, user akan diminta metode pembayaran / donasi. <br />

**7. Form Donasi Sembako (Rakhan)** <br />
Modul ini digunakan oleh user yang telah login untuk memberikan donasi berupa sembako. Modul ini akan berisi formulir yang dapat diisi oleh user mengenai bentuk, jenis barang, serta banyak jumlahnya. Implementasi ide dari form ini akan diambil dari katalog yang ada pada menu Gofood. <br />

**8. Form Donasi (donor) Darah (Alvin)** <br />
Modul ini digunakan oleh user yang telah login untuk mendonor darah. Modul ini akan meminta data user berupa nama, tanggal lahir, domisili, golongan darah, rhesus, umur, penyakit bawaan, tempat user ingin donor (pilihan PMI mana). Setelah mendaftar form tersebut, user akan mendapat nomor antrian dan informasi umum yang telah diisi sebelumnya dapat dilihat pada bagian profile user. <br />

**9. Form Pendaftaran Volunteer (Asnat)** <br />
Modul ini digunakan oleh user yang telah login untuk mendaftar menjadi volunteer pada suatu project. Modul ini akan menampilkan project yang sedang membuka pendaftaran untuk volunteer, bidang atau divisi yang tersedia, dan rentang waktu menjadi volunteer. <br />

## ALUR PENGINTEGRASIAN
Dalam proses pengintegrasian dengan _web service_ agar terhubung dengan aplikasi web yang telah dibuat saat proyek tengah semester, aplikasi Pedulee menggunakan : <br />
- **Flutter** sebagai frontend mobile, yaitu dengan memanfaatkan widget dan benchmark desain frontend website yang ada pada Flutter <br />
- **Konsep asynchronus `HTTP`** sebagai frontend-backend, yaitu dalam pengintegrasian antara frontend dan backend <br />
- **JSON Serializer Django atau JsonResponse** sebagai backend, yaitu dalam pengimplementasian REST API pada backend Django dengan web service pada web pedulee sebelumnya, yaitu web pada heroku. <br />

Alur pengintegrasian juga dapat dikatakan sebagai berikut : <br />
a. Menambahkan dependensi `http` <br />
b. (Opsional) Membuat model sesuai dengan respons data <br />
c. Membuat fungsi http request untuk mengambil data dari suatu url dan mendecode data yang sudah diambil dan diubah ke bentuk JSON <br />
d. Melakukan HTTP Request dengan method `GET` dan respons yang didapatkan akan dikonversi ke dalam model yang telah dibuat <br />
e. Menampilkan data yang telah dikonversi menggunakan `FutureBuilder`. <br />
