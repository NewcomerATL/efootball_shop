# efootball_shop
# Anderson Tirza Liman
# 2406355893
# Kelas B

---

## 🧩 1. Widget Tree dan Hubungan Parent–Child

Dalam Flutter, **semua elemen adalah widget** — mulai dari teks, tombol, hingga layout.  
Widget tersusun secara hierarkis seperti **pohon (Widget Tree)** di mana setiap widget dapat memiliki **parent** (induk) dan **child** (anak).

Contoh dari kode:
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

