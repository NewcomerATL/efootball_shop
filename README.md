# eFootball Shop - Flutter
- Anderson Tirza Liman
- 2406355893
- Kelas B

---

## 1. Widget Tree dan Hubungan Parent–Child

Widget tree adalah representasi logis dari seluruh struktur antarmuka pengguna (UI) di aplikasi Flutter.
Setiap elemen visual—mulai dari tombol (Button), teks (Text), hingga tata letak (Column, Row, GridView)—semuanya merupakan widget, dan setiap widget menempati posisi tertentu di dalam pohon tersebut.

Menurut materi kuliah Intro to Dart Programming and Flutter Framework (slide 33), "The widget tree is the logical representation of all the UI’s widgets. It is computed during layout and used during rendering and hit testing."
Artinya, Flutter membangun tampilan layar berdasarkan pohon widget ini:

- Layouting → menentukan ukuran dan posisi widget.

- Rendering → menggambar tampilan ke layar.

- Hit testing → mendeteksi interaksi pengguna seperti tap atau drag.

Contoh kode:
```dart
Scaffold(
  appBar: AppBar(...),
  body: Column(
    children: [
      Row(
        children: [
          InfoCard(...),
          InfoCard(...),
          InfoCard(...),
        ],
      ),
      GridView.count(...),
    ],
  ),
)
```

Struktur hierarkinya:
```sql
Scaffold
 ├── AppBar
 └── Column
      ├── Row
      │    ├── InfoCard
      │    ├── InfoCard
      │    └── InfoCard
      └── GridView
           ├── ItemCard
           ├── ItemCard
           └── ItemCard
```

Hubungan antar widget diatur dalam bentuk hierarki induk–anak (parent–child):

Parent widget adalah widget yang berisi atau mengatur satu atau lebih child widget.

Child widget berada di dalam parent, mengikuti aturan tata letak dan perilaku yang ditentukan oleh parent.

Pada contoh struktur hierarki di atas, analisisnya adalah sebagai berikut:
- Scaffold bertindak sebagai parent utama yang mengatur keseluruhan halaman.

- AppBar, Column, GridView dan Row adalah child di bawahnya.

- Masing-masing InfoCard dan ItemCard juga bisa menjadi parent bagi elemen lainnya.

# 2. Widget yang Digunakan dan Fungsinya

| Widget                      | Fungsi                                                                    |
| --------------------------- | ------------------------------------------------------------------------- |
| `MaterialApp`               | Widget root aplikasi yang menyediakan tema dan navigasi Material Design.  |
| `ThemeData` & `ColorScheme` | Mengatur warna dan gaya tema aplikasi.                                    |
| `Scaffold`                  | Struktur dasar halaman (AppBar, Body, dll).                               |
| `AppBar`                    | Bilah atas aplikasi yang berisi judul.                                    |
| `Padding`                   | Memberikan jarak di sekitar widget.                                       |
| `Column`                    | Menyusun widget secara vertikal.                                          |
| `Row`                       | Menyusun widget secara horizontal.                                        |
| `InfoCard` *(custom)*       | Kartu yang menampilkan data NPM, Nama, dan Kelas.                         |
| `Card`                      | Membuat tampilan berbentuk kotak dengan bayangan (elevasi).               |
| `Container`                 | Mengatur ukuran, padding, dan warna latar.                                |
| `Text`                      | Menampilkan teks.                                                         |
| `SizedBox`                  | Memberi jarak antar widget.                                               |
| `GridView.count`            | Menampilkan kumpulan item dalam bentuk grid dengan jumlah kolom tertentu. |
| `ItemCard` *(custom)*       | Tombol menu dengan ikon dan warna berbeda.                                |
| `Material`                  | Memberi efek visual material (warna, bayangan, klik).                     |
| `InkWell`                   | Menangani aksi klik/tap dengan efek ripple.                               |
| `Icon`                      | Menampilkan ikon Material Design.                                         |
| `SnackBar`                  | Menampilkan pesan sementara di bagian bawah layar.                        |
| `ScaffoldMessenger`         | Mengatur SnackBar agar muncul di Scaffold aktif.                          |
| `MediaQuery`                | Mengambil ukuran layar untuk layout responsif.                            |

# 3. Fungsi MaterialApp dan Alasan Menjadi Widget Root

MaterialApp adalah titik awal (root widget) dari aplikasi Flutter berbasis Material Design.
Beberapa fungsi utamanya:

- Menyediakan tema global (ThemeData, ColorScheme).

- Mengatur navigasi antar halaman (home, routes).

- Menentukan judul aplikasi (title).

- Mendukung localization dan debug banner.

Alasan dirinya menjadi root ialah karena semua widget di bawahnya membutuhkan akses ke context MaterialApp untuk menerapkan tema, navigasi, dan tampilan khas Material Design.

# 4. Perbedaan StatelessWidget dan StatefulWidget
| Aspek       | StatelessWidget                                       | StatefulWidget                                          |
| ----------- | ----------------------------------------------------- | ------------------------------------------------------- |
| Data        | Tidak berubah (immutable)                             | Dapat berubah selama runtime                            |
| Lifecycle   | Dibuat sekali, tidak direbuild kecuali parent berubah | Memiliki state yang bisa diperbarui dengan `setState()` |
| Cocok untuk | UI statis (teks, ikon, layout)                        | UI dinamis (counter, form, animasi)                     |
| Contoh      | `Text`, `Icon`, `InfoCard`                            | `Checkbox`, `Slider`, `TextField`                       |

# 5. BuildContext dan Peranan Pentingnya
BuildContext merepresentasikan posisi sebuah widget di dalam Widget Tree.
Ia digunakan Flutter untuk mengetahui di mana widget itu berada dan untuk mengakses data dari parent widget.

Contoh kode:
``` dart
Theme.of(context).colorScheme.primary
```
Keterangan: context digunakan untuk mengambil warna utama (primary) dari tema aplikasi yang didefinisikan di atasnya.

Fungsi BuildContext:

- Mengakses tema global (Theme.of(context))

- Menampilkan SnackBar (ScaffoldMessenger.of(context).showSnackBar)

- Navigasi antar halaman (Navigator.of(context).push)

- Digunakan di metode build(BuildContext context) untuk membangun UI.

# 6. Hot Reload vs Hot Restart

| Fitur       | Hot Reload                              | Hot Restart                                        |
| ----------- | --------------------------------------- | -------------------------------------------------- |
| Tujuan      | Mempercepat uji perubahan kecil pada UI | Mengulang seluruh aplikasi dari awal               |
| State       | **Dipertahankan**                       | **Direset ke awal**                                |
| Kecepatan   | Sangat cepat                            | Lebih lambat                                       |
| Cocok untuk | Perubahan tampilan, layout, warna       | Perubahan variabel global, inisialisasi ulang data |
