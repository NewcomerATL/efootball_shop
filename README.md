# eFootball Shop - Fl3utter
- Anderson Tirza Liman
- 2406355893
- Kelas B

---

# Tugas 7
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

## 2. Widget yang Digunakan dan Fungsinya

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

## 3. Fungsi MaterialApp dan Alasan Menjadi Widget Root

MaterialApp adalah titik awal (root widget) dari aplikasi Flutter berbasis Material Design.
Beberapa fungsi utamanya:

- Menyediakan tema global (ThemeData, ColorScheme).

- Mengatur navigasi antar halaman (home, routes).

- Menentukan judul aplikasi (title).

- Mendukung localization dan debug banner.

Alasan dirinya menjadi root ialah karena semua widget di bawahnya membutuhkan akses ke context MaterialApp untuk menerapkan tema, navigasi, dan tampilan khas Material Design.

## 4. Perbedaan StatelessWidget dan StatefulWidget
| Aspek       | StatelessWidget                                       | StatefulWidget                                          |
| ----------- | ----------------------------------------------------- | ------------------------------------------------------- |
| Data        | Tidak berubah (immutable)                             | Dapat berubah selama runtime                            |
| Lifecycle   | Dibuat sekali, tidak direbuild kecuali parent berubah | Memiliki state yang bisa diperbarui dengan `setState()` |
| Cocok untuk | UI statis (teks, ikon, layout)                        | UI dinamis (counter, form, animasi)                     |
| Contoh      | `Text`, `Icon`, `InfoCard`                            | `Checkbox`, `Slider`, `TextField`                       |

## 5. BuildContext dan Peranan Pentingnya
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

## 6. Hot Reload vs Hot Restart

| Fitur       | Hot Reload                              | Hot Restart                                        |
| ----------- | --------------------------------------- | -------------------------------------------------- |
| Tujuan      | Mempercepat uji perubahan kecil pada UI | Mengulang seluruh aplikasi dari awal               |
| State       | **Dipertahankan**                       | **Direset ke awal**                                |
| Kecepatan   | Sangat cepat                            | Lebih lambat                                       |
| Cocok untuk | Perubahan tampilan, layout, warna       | Perubahan variabel global, inisialisasi ulang data |

# Tugas 8

## 1. Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`

### `Navigator.push()`
Metode push menambahkan halaman baru di atas stack navigasi tanpa menghapus halaman sebelumnya.  
Artinya, pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol Back.

#### 💡 Contoh penggunaan dalam aplikasi:
Pada tombol **“Add Product”** di `menu.dart`:

```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductFormPage()),
    );
  },
  child: const Text('Add Product'),
),
```

Pada konteks tersebut, Navigator.push() digunakan agar pengguna bisa membuka form penambahan produk dan kembali ke halaman utama setelah selesai.

### `Navigator.pushReplacement()`

Berbeda dengan push(), metode ini mengganti halaman saat ini dengan halaman baru.
Halaman lama dihapus dari stack, sehingga pengguna tidak dapat kembali ke halaman sebelumnya.

#### 💡 Contoh penggunaan dalam aplikasi:
Pada navigasi dari `left_drawer.dart` menuju halaman utama (MyHomePage):

```dart
onTap: () {
  Navigator.pop(context); // Tutup drawer terlebih dahulu
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const MyHomePage()),
  );
},
```
Penggunaan pushReplacement() adalah benar dan tepat karena setelah pengguna berpindah halaman melalui Drawer, mereka tidak perlu kembali ke halaman sebelumnya dengan tombol Back.

## 2. Pemanfaatan Hierarchy Widget (Scaffold, AppBar, Drawer)

Aplikasi Football Shop memanfaatkan hierarki widget Flutter untuk menciptakan struktur halaman yang konsisten:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Football Shop'),
    backgroundColor: Colors.green,
  ),
  drawer: const LeftDrawer(),
  body: const MenuPage(),
);
```
- Scaffold menjadi kerangka utama setiap halaman; Komponen tersebut menyediakan struktur umum: AppBar, body, Drawer, FloatingActionButton, dsb.

- AppBar berfungsi sebagai header yang menampilkan judul halaman dan konsisten di setiap tampilan.

- Drawer (left_drawer.dart) berisi menu navigasi ke berbagai halaman aplikasi seperti Home, Add Product, atau Product List.

Dengan pendekatan tersebut, semua halaman (misalnya MenuPage, ProductFormPage) memiliki tampilan yang seragam dan mudah dinavigasi.


## 3. Kelebihan Layout Widget (Padding, SingleChildScrollView, ListView)

Ketiga widget ini digunakan untuk menjaga kenyamanan tampilan form pada berbagai ukuran layar dan menghindari overflow.

```dart
body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Product Name',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Price',
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            // Logic penambahan produk
            Navigator.pop(context); // kembali ke MenuPage
          },
          child: const Text('Submit'),
        ),
      ],
    ),
  ),
),
```

Adapun beberapa kelebihannya antara lain:
- Padding: Memberi jarak di tepi layar agar konten tidak menempel pada pinggir.

- SingleChildScrollView: Membuat halaman dapat di-scroll saat keyboard muncul atau layar kecil.

- ListView (jika digunakan): Lebih efisien saat menampilkan daftar produk dari data dinamis, misalnya di halaman utama menu.dart.

## 4. Penyesuaian Warna Tema untuk Identitas Visual

Semua warna tema disesuaikan melalui **Theme Data** dalam **MaterialApp**.
Pada aplikasi ini, kodenya adalah:
``` dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(secondary: Colors.blueAccent[400]),
  ),
  home: MyHomePage(),
);
```
ThemeData digunakan untuk global styling

ThemeData adalah theme global Flutter — ia mendefinisikan warna, font, bentuk tombol, ikon, dan elemen UI lain untuk seluruh aplikasi.
Semua widget bawaan seperti AppBar, FloatingActionButton, ElevatedButton, dan TextFormField otomatis mengikuti nilai di ThemeData tanpa perlu diatur manual satu per satu.

Contohnya:

- Semua AppBar otomatis menggunakan warna dari primarySwatch: Colors.blue.

- Tombol seperti ElevatedButton atau FloatingActionButton menggunakan warna primary dan secondary sesuai yang kamu definisikan.

Kemudian ColorScheme membuat warna menjadi konsisten. Kodenya:
```dart
colorScheme: ColorScheme.fromSwatch(
  primarySwatch: Colors.blue,
).copyWith(secondary: Colors.blueAccent[400]),
```

Hal tersebut menandakan bahwa telah ditetapkan warna utama (primary) → Colors.blue
Digunakan untuk AppBar, tombol utama, dan highlight elemen.

Menetapkan warna sekunder (secondary) → Colors.blueAccent[400]
Digunakan untuk aksen seperti ikon aktif, progress bar, dan efek fokus.

Jadi, seluruh komponen UI yang menggunakan “warna tema” otomatis sinkron dengan dua warna utama ini.
Tidak perlu lagi memanggil Colors.blue secara manual di setiap widget.

Kemudian, pada bagian implementasinya:
Setiap halaman (menu.dart, productlist_form.dart, dsb.) menggunakan struktur Scaffold dan AppBar.
Karena AppBar tidak diberikan warna manual (backgroundColor:), Flutter otomatis mengambil warna dari tema global (Theme.of(context).colorScheme.primary).
Hal ini memastikan bahwa:

- Semua halaman memiliki warna biru yang sama pada AppBar.

- Semua tombol (ElevatedButton) memiliki warna biru yang sama juga.

# Tugas 9

## 1. Perlunya Membuat Model Dart untuk JSON

Saat Flutter menerima atau mengirim data ke Django, datanya berbentuk JSON. Dibuatlah sebuah model Dart agar JSON tersebut dapat diterjemahkan menjadi objek dengan tipe data yang jelas, aman, dan mudah digunakan. Jika langsung memakai **Map<String, dynamic>**, maka akan kehilangan validasi tipe, berpotensi salah akses key, dan sulit melakukan refactor.

Contoh model Dart:
```dart
class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}
```
Tanpa model:

```dart
// raw map - tidak aman
var name = data["nama"]; // JSON tidak punya key "nama" → error runtime
```

Model menjaga konsistensi, null-safety, dan memudahkan maintainability.

## 2. Fungsi Package http dan CookieRequest

Package http digunakan untuk melakukan permintaan HTTP biasa, tanpa menyimpan sesi atau cookie. Ini cocok untuk endpoint publik seperti GET daftar item.

Sedangkan CookieRequest (dari pbp_django_auth) menangani request yang membutuhkan autentikasi, karena otomatis menyimpan dan mengirim cookie Django (sessionid).

Perbedaannya secara singkat:

- http → stateless request, tidak menyimpan sesi.

- CookieRequest → stateful request, menyimpan cookie login.

Contoh:

``` dart
final request = context.watch<CookieRequest>();
var response = await request.login("http://.../auth/login/", {
  "username": "user",
  "password": "pass",
});
```

## 3. Alasan CookieRequest Harus Dibagikan ke Semua Komponen Flutter

Karena status login pengguna tersimpan dalam CookieRequest, seluruh halaman yang membutuhkan autentikasi harus mengakses instance yang sama. Jika setiap widget membuat instance baru, cookie login akan hilang, pengguna dianggap belum login, dan permintaan ke Django akan ditolak.

Provider membuat CookieRequest dapat diakses global:

``` dart
return Provider(
  create: (_) => CookieRequest(),
  child: MyApp(),
);
```

## 4. Konfigurasi Konektivitas antara Flutter dan Django

Untuk Flutter dapat berkomunikasi dengan Django, beberapa konfigurasi wajib dilakukan, antara lain:

- Menambahkan 10.0.2.2 di ALLOWED_HOSTS:
- - Emulator Android menerjemahkan localhost → 10.0.2.2.
- - Tanpa ini, Django akan menolak request.

- Aktifkan CORS
- - Agar Flutter (mobile/localhost) diizinkan mengakses Django API.

- Atur cookie dan SameSite
- - Cookie autentikasi Django harus bisa dikirim ke Flutter:

```python
SESSION_COOKIE_SAMESITE = "None"
SESSION_COOKIE_SECURE = True
```

- Tambahkan internet permission di Android
- - Pada AndroidManifest.xml:

``` html
<uses-permission android:name="android.permission.INTERNET"/>
```

Jika salah satu bagian tidak dikonfigurasi, maka:

- Flutter tidak bisa login

- request ditolak Django (CORS error / forbidden host)

- cookie tidak tersimpan

- API tidak bisa diakses sama sekali

## 5. Mekanisme Pengiriman Data dari Input ke Django ke Flutter

Alur data:

- Pengguna mengisi form pada Flutter.

- Flutter mengirim data ke Django melalui http atau CookieRequest.

- Django memproses data (validasi, simpan ke database).

- Django mengembalikan response JSON.

- Flutter menerima JSON dan memparsingnya menggunakan model Dart.

- Data tampil pada UI dalam bentuk list, card, detail produk, dll.

Contoh pengiriman data:

``` dart
await request.postJson("http://.../create/",
{
  "name": nameController.text,
  "price": priceController.text,
});
```

## 6. Mekanisme Autentikasi: Login, Register, Logout

### Login
Flutter mengirim username & password ke Django:

``` dart
var response = await request.login("http://.../login/", {
  "username": "myuser",
  "password": "mypass",
});
```

Django memverifikasi akun dan mengembalikan cookie sessionid.
CookieRequest menyimpan sessionid sehingga Flutter dianggap login.

### Register
Flutter mengirim data akun, lalu Django membuat user baru.
Setelah sukses, pengguna dapat login melalui endpoint login Django.

Akses halaman yang butuh autentikasi
Setiap request selanjutnya otomatis menyertakan cookie login.

### Logout
Flutter memanggil:

```dart
await request.logout("http://.../logout/");
```

Django menghapus session, dan CookieRequest membersihkan cookie lokal.

Jika autentikasi berhasil, Flutter menampilkan menu utama dan semua fitur yang hanya dapat diakses oleh user login.

### Langkah Implementasi Checklist
