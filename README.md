# Resume Materi Sesi 9
## Extension Methods dalam Pemrograman Berorientasi Objek

**Nama :** Azhar Rizki Ismail 
**NIM :** 23141005P
**Kelas :** SI6KR
**Mata Kuliah :** Pemrograman Berorientasi Objek  

---

# Pendahuluan


Dalam pengembangan aplikasi modern, programmer sering membutuhkan fungsi tambahan untuk tipe data yang sudah tersedia seperti String, List, int, maupun class buatan sendiri. Namun, menambahkan fungsi secara langsung ke class bawaan tidak selalu memungkinkan karena kode asli dari class tersebut tidak dapat diubah. Oleh karena itu, Dart menyediakan fitur Extension Methods sebagai solusi untuk menambahkan kemampuan baru pada suatu tipe data tanpa perlu memodifikasi class aslinya.

Extension Methods merupakan fitur yang diperkenalkan sejak Dart 2.7 dan digunakan untuk membuat kode menjadi lebih rapi, natural, dan mudah dibaca. Dengan extension, programmer dapat memanggil method tambahan seolah-olah method tersebut memang berasal dari class aslinya. Hal ini sangat membantu dalam pembuatan utility function, validasi data, formatting, maupun pengolahan data yang sering digunakan berulang kali dalam program.

Selain meningkatkan keterbacaan kode, Extension Methods juga mendukung berbagai fitur penting seperti null safety, generic extension, unnamed extension, hingga extension untuk custom class. Penggunaan extension methods yang tepat dapat membantu programmer membangun aplikasi yang lebih modular, reusable, dan maintainable sehingga proses pengembangan perangkat lunak menjadi lebih efisien dan terstruktur.


---

# Extension Methods

## Pengertian Extension Methods

Extension Methods adalah fitur pada Dart yang digunakan untuk menambahkan method, getter, setter, maupun operator baru ke tipe data atau class yang sudah ada tanpa perlu mengubah kode asli dari class tersebut. Dengan extension methods, programmer dapat membuat fungsi tambahan pada tipe bawaan seperti String, List, int, dan double, maupun pada custom class sehingga penggunaan kode menjadi lebih natural dan mudah dibaca. Fitur ini sangat berguna untuk membuat utility function, validasi data, formatting, serta mengurangi penulisan helper class yang terlalu banyak.


## Masalah Tanpa Extension Methods

Sebelum adanya Extension Methods, programmer biasanya membuat utility class untuk menambahkan fungsi tambahan pada tipe data tertentu seperti String atau List. Cara ini memang dapat digunakan, tetapi pemanggilan method menjadi kurang natural karena harus memanggil nama utility class terlebih dahulu. Selain membuat kode lebih panjang, pendekatan ini juga membuat program menjadi kurang fleksibel dan sulit dibaca ketika utility function semakin banyak digunakan dalam proyek.

### Contoh :

```dart
class StringUtils {
  static String capitalize(String text) {
    if (text.isEmpty) return text;

    return text[0].toUpperCase() + text.substring(1);
  }

  static bool isEmail(String text) {
    return text.contains('@');
  }
}

void main() {
  var name = 'john';

  var capitalized = StringUtils.capitalize(name);

  var emailCheck = StringUtils.isEmail('test@mail.com');

  print('Original name: $name');
  print('Capitalized name: $capitalized');
  print('Is test@mail.com an email? $emailCheck');
}
```
<img width="1909" height="953" alt="Masalah Tanpa Extension" src="https://github.com/user-attachments/assets/30171e6b-bc8e-4f61-bb9c-e334677954aa" />


## Solusi Dengan Extension Methods

Extension Methods hadir sebagai solusi untuk menambahkan fungsi baru pada tipe data yang sudah ada tanpa perlu membuat utility class terpisah. Dengan extension methods, method dapat dipanggil langsung pada object sehingga kode menjadi lebih ringkas, mudah dibaca, dan terlihat seperti method bawaan dari tipe data tersebut. Pendekatan ini membuat program lebih fleksibel dan membantu programmer mengelompokkan fungsi tambahan sesuai tipe data yang digunakan.

### Contoh :

```dart
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }

  bool isEmail() {
    return contains('@');
  }
}

void main() {
  var name = 'john';

  var capitalized = name.capitalize();

  var emailCheck = 'test@mail.com'.isEmail();

  print('Original name: $name');
  print('Capitalized name: $capitalized');
  print('Is test@mail.com an email? $emailCheck');
}
```
<img width="1910" height="953" alt="Solusi dengan Extension" src="https://github.com/user-attachments/assets/bc732379-28ce-43c8-955b-b23e42c347f9" />


## Sintaks Extension Methods

Sintaks Extension Methods pada Dart digunakan dengan kata kunci extension yang diikuti nama extension dan tipe data yang ingin ditambahkan method baru menggunakan kata on. Di dalam extension tersebut, programmer dapat menambahkan method, getter, setter, maupun operator sehingga tipe data asli memiliki kemampuan tambahan tanpa mengubah class aslinya. Dengan sintaks ini, method dapat dipanggil langsung pada object sehingga kode menjadi lebih sederhana dan mudah dipahami.

### Contoh :

```dart
extension NumberExtension on int {
  int square() {
    return this * this;
  }

  int cube() {
    return this * this * this;
  }
}

void main() {
  int number = 5;

  print('Square: ${number.square()}');
  print('Cube: ${number.cube()}');
}
```
<img width="1909" height="953" alt="Sintaks Extension" src="https://github.com/user-attachments/assets/c50cbe9a-8179-499c-ae58-e4eaf3b996b6" />


## Tipe yang bisa di-Extend

Pada Dart, Extension Methods dapat diterapkan pada berbagai tipe data seperti String, int, double, List, Map, maupun custom class buatan sendiri. Hal ini memungkinkan programmer menambahkan fungsi tambahan pada tipe data bawaan maupun object tertentu tanpa harus mengubah kode aslinya. Dengan kemampuan tersebut, extension methods menjadi lebih fleksibel dan dapat digunakan untuk berbagai kebutuhan seperti formatting, validasi, manipulasi data, dan utility function lainnya.

### Contoh :

```dart
extension StringExtension on String {
  String reverse() {
    return split('').reversed.join();
  }
}

extension IntExtension on int {
  bool isEvenNumber() {
    return this % 2 == 0;
  }
}

extension ListExtension on List {
  int totalItems() {
    return length;
  }
}

void main() {
  String text = 'Dart';
  int number = 10;
  List fruits = ['Apple', 'Banana', 'Orange'];

  print(text.reverse());

  print(number.isEvenNumber());

  print(fruits.totalItems());
}
```
<img width="1913" height="954" alt="tipe yang bisa diextend" src="https://github.com/user-attachments/assets/d0ef2252-81aa-4612-8da2-efbb6a59134a" />


## Extension untuk Null Safety

Dart mendukung null safety untuk membantu mencegah terjadinya error akibat nilai null. Extension Methods juga dapat diterapkan pada tipe data nullable seperti String? atau int? sehingga programmer dapat menambahkan method tambahan yang lebih aman saat menangani data kosong atau null. Dengan extension untuk null safety, kode menjadi lebih aman, rapi, dan mengurangi penggunaan pengecekan null secara berulang dalam program.

### Contoh :

```dart
extension StringExtension on String {
  String reverse() {
    return split('').reversed.join();
  }
}

extension IntExtension on int {
  bool isEvenNumber() {
    return this % 2 == 0;
  }
}

extension ListExtension on List {
  int totalItems() {
    return length;
  }
}

void main() {
  String text = 'Dart';
  int number = 10;
  List fruits = ['Apple', 'Banana', 'Orange'];

  print(text.reverse());

  print(number.isEvenNumber());

  print(fruits.totalItems());
}
```
<img width="1909" height="951" alt="Extension untuk Null Safety" src="https://github.com/user-attachments/assets/75dc4094-8ee6-4cc7-8ca7-9a38184aa691" />


---

## Generic Extensions

Generic Extensions digunakan untuk membuat extension methods yang dapat bekerja pada berbagai tipe data secara fleksibel menggunakan generic type <T>. Dengan generic extensions, programmer dapat membuat method tambahan untuk collection seperti List<T> tanpa terikat pada satu tipe data tertentu. Hal ini membuat extension menjadi lebih reusable, efisien, dan dapat digunakan pada berbagai jenis data dengan kode yang lebih ringkas.

### Contoh :

```dart
extension ListExtensions<T> on List<T> {
  T? getOrNull(int index) {
    if (index < 0 || index >= length) {
      return null;
    }

    return this[index];
  }

  List<List<T>> chunk(int size) {
    List<List<T>> chunks = [];

    for (int i = 0; i < length; i += size) {
      chunks.add(
        sublist(
          i,
          i + size > length ? length : i + size,
        ),
      );
    }

    return chunks;
  }

  List<T> distinct() {
    List<T> result = [];

    for (var item in this) {
      if (!result.contains(item)) {
        result.add(item);
      }
    }

    return result;
  }
}

void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7];

  print(numbers.getOrNull(2));

  print(numbers.chunk(3));

  print([1, 2, 2, 3, 3, 3].distinct());
}
```
<img width="1908" height="951" alt="Generic Extensions" src="https://github.com/user-attachments/assets/512da4a5-0667-4864-8dd4-30a164de0b2d" />


## Unnamed Extensions

Unnamed Extensions adalah extension methods yang dibuat tanpa nama sehingga hanya dapat digunakan di dalam file atau library yang sama. Jenis extension ini biasanya digunakan untuk kebutuhan internal dan utility sederhana yang tidak perlu diakses dari file lain. Dengan unnamed extensions, programmer dapat menambahkan fungsi tambahan tanpa harus membuat nama extension baru sehingga kode menjadi lebih ringkas dan tetap terorganisir.

### Contoh :

```dart
extension on DateTime {
  String get toYYYYMMDD {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }
}

void main() {
  var today = DateTime.now();

  print(today.toYYYYMMDD);

  print(today.startOfDay);
}
```
<img width="1909" height="949" alt="Unnamed Extensions" src="https://github.com/user-attachments/assets/59561b38-fb8f-418c-b710-b54e10d51e40" />


## Konflik Nama Extensions

Konflik nama extension dapat terjadi ketika terdapat beberapa extension yang memiliki nama method yang sama pada tipe data yang sama. Kondisi ini membuat Dart tidak dapat menentukan method mana yang harus digunakan sehingga menimbulkan ambiguity atau error. Untuk mengatasi masalah tersebut, programmer dapat menggunakan prefix import, maupun memilih extension tertentu agar pemanggilan method menjadi lebih jelas dan tidak bentrok.

### Contoh :

```dart
extension StringExtensionA on String {
  String capitalize() {
    return toUpperCase();
  }
}

extension StringExtensionB on String {
  String capitalize() {
    return 'Hello $this';
  }
}

void main() {
  String text = 'dart';

  print(StringExtensionA(text).capitalize());

  print(StringExtensionB(text).capitalize());
}
```
<img width="1907" height="953" alt="Konflik Nama Extension" src="https://github.com/user-attachments/assets/c0c48526-8adf-4e8a-885e-ed2062f7718f" />


## Extension untuk Custom Classes

Extension Methods tidak hanya dapat digunakan pada tipe data bawaan Dart, tetapi juga dapat diterapkan pada custom class yang dibuat sendiri. Dengan extension untuk custom classes, programmer dapat menambahkan fungsi tambahan pada object tanpa perlu mengubah struktur class aslinya. Hal ini membuat kode lebih fleksibel, modular, dan memudahkan penambahan fitur baru tanpa mengganggu implementasi utama dari class tersebut.

### Contoh :

```dart
class Mahasiswa {
  String nama;
  double ipk;

  Mahasiswa(this.nama, this.ipk);
}

extension MahasiswaExtension on Mahasiswa {
  String get predikat {
    if (ipk >= 3.5) {
      return 'Cumlaude';
    } else if (ipk >= 3.0) {
      return 'Sangat Memuaskan';
    } else {
      return 'Memuaskan';
    }
  }

  void tampilkanInfo() {
    print('Nama      : $nama');
    print('IPK       : $ipk');
    print('Predikat  : $predikat');
  }
}

void main() {
  var mahasiswa = Mahasiswa('Azhar Rizki', 3.75);

  mahasiswa.tampilkanInfo();
}
```
<img width="1908" height="954" alt="Extension custom classes" src="https://github.com/user-attachments/assets/21ca36e6-e378-4198-b4c5-34c73deca889" />


---

# Kesimpulan

Extension Methods merupakan fitur pada Dart yang digunakan untuk menambahkan method baru pada tipe data atau class yang sudah ada tanpa perlu mengubah kode aslinya. Fitur ini membantu programmer membuat kode menjadi lebih ringkas, mudah dibaca, dan lebih natural karena method dapat dipanggil langsung pada object yang digunakan. Dengan extension methods, berbagai utility function dapat dikelompokkan dengan lebih rapi sesuai tipe data yang berkaitan.

Dalam penerapannya, Extension Methods mendukung berbagai fitur penting seperti null safety, generic extensions, unnamed extensions, hingga extension pada custom class. Selain itu, extension juga dapat diterapkan pada berbagai tipe data bawaan Dart seperti String, int, List, dan DateTime, sehingga programmer memiliki fleksibilitas lebih dalam menambahkan fungsi tambahan sesuai kebutuhan aplikasi. Penggunaan extension methods yang tepat dapat membantu mengurangi penulisan utility class yang berlebihan dan meningkatkan kualitas struktur kode program.

Melalui materi ini dapat dipahami bahwa Extension Methods merupakan salah satu fitur penting dalam Dart untuk meningkatkan efisiensi pengembangan aplikasi. Dengan memahami sintaks, konsep generic, null safety, serta penanganan konflik nama extension, programmer dapat membuat kode yang lebih modular, reusable, dan maintainable. Oleh karena itu, Extension Methods sangat bermanfaat dalam membangun aplikasi yang lebih terstruktur dan mudah dikembangkan di masa mendatang.ofesional.

---

# Praktik 1

## Utilities untuk Dart Types

```dart
extension NumberExtensions on num {
  String toRupiah() {
    return 'Rp${toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }

  num power(int exponent) {
    var result = this;

    for (var i = 1; i < exponent; i++) {
      result *= this;
    }

    return result;
  }
}

void main() {
  var price = 1500000;

  print(price.toRupiah());

  print(5.isBetween(1, 10));

  print(2.power(3));
}
```
<img width="1910" height="952" alt="praktik 1" src="https://github.com/user-attachments/assets/44f80d32-91c7-4615-83f3-bb7c2a47181b" />


---

# Praktik 2

## Validator Extensions

```dart
extension StringValidators on String {
  bool get isEmail {
    return RegExp(
      r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(this);
  }

  bool get isPhoneNumber {
    return RegExp(r'^[0-9]{10,13}$').hasMatch(this);
  }

  bool get isStrongPassword {
    return length >= 8 &&
        contains(RegExp(r'[A-Z]')) &&
        contains(RegExp(r'[a-z]')) &&
        contains(RegExp(r'[0-9]'));
  }

  bool get isUrl {
    try {
      Uri.parse(this);

      return true;
    } catch (_) {
      return false;
    }
  }
}

extension IntValidators on int {
  bool get isAdultAge => this >= 18;

  bool get isPositive => this >= 0;

  bool get isEven => this % 2 == 0;

  bool get isOdd => this % 2 != 0;
}

void main() {
  var email = 'test@example.com';

  var age = 25;

  var password = 'Pass1234';

  print(email.isEmail);

  print(age.isAdultAge);

  print(password.isStrongPassword);

  print(10.isEven);
}
```
<img width="1909" height="954" alt="praktik 2" src="https://github.com/user-attachments/assets/1a39ab3a-8e5c-4d0f-9b7a-0edb3c0b2a15" />


---

# Soal 1

## Konflik Nama Antar Extension

Pertanyaan :
Apa yang terjadi saat kode dijalankan? Jelaskan penyebabnya dan berikan solusi agar kedua extension dapat digunakan tanpa konflik.

<img width="1908" height="952" alt="soal 1 yg eror" src="https://github.com/user-attachments/assets/de797c3b-28b5-4e06-9716-9380e2cf03d2" />


Jawaban :
Saat kode dijalankan, program akan menghasilkan error ambiguity (konflik extension) karena terdapat dua extension (StringNumber dan StringDouble) yang memiliki method dengan nama sama yaitu toInt() pada tipe data yang sama (String). Dart menjadi bingung menentukan method mana yang harus dipanggil ketika angka.toInt() dijalankan.

Penyebab masalah tersebut adalah kedua extension menambahkan method dengan signature yang sama pada class String, meskipun return type-nya berbeda. Dalam Dart, return type tidak digunakan untuk membedakan method, sehingga dianggap konflik.

Solusi agar kedua extension tetap dapat digunakan adalah dengan memanggil extension secara eksplisit menggunakan nama extension-nya.

```dart
extension StringNumber on String {
  int toInt() {
    return int.parse(this);
  }
}

extension StringDouble on String {
  double toInt() {
    return double.parse(this);
  }
}

void main() {
  String angka = '123';

  print(StringNumber(angka).toInt());

  print(StringDouble(angka).toInt());
}
```
<img width="1909" height="952" alt="soal 1 yg bener" src="https://github.com/user-attachments/assets/acae40a9-8cd3-4e7e-9ba2-f63c01f0b9a0" />


---

# Soal 2

## Extension Method Tidak Bisa Mengakses Member Private

Pertanyaan :
Jelaskan mengapa kode di atas gagal dikompilasi. Bagaimana cara memperbaikinya tanpa mengubah akses modifier _value menjadi publik?


Jawaban :
Kode tersebut gagal dikompilasi karena extension CounterStats mencoba mengakses atribut private _value secara langsung. Dalam Dart, atribut yang diawali tanda underscore (_) bersifat private terhadap library, sehingga tidak bisa diakses sembarangan dari luar class atau library tempat atribut tersebut dibuat.
extension tidak dapat menemukan member _value karena atribut private tersebut hanya dapat diakses oleh class Counter di dalam library yang sama.
Cara memperbaikinya tanpa mengubah _value menjadi publik adalah dengan menyediakan getter publik di dalam class Counter, lalu extension mengakses getter tersebut.
Solusi agar kedua extension tetap dapat digunakan adalah dengan memanggil extension secara eksplisit menggunakan nama extension-nya.

```dart
class Counter {
  int _value = 0;

  void increment() {
    _value++;
  }

  int get value => _value;
}

extension CounterStats on Counter {
  int getValue() {
    return value;
  }
}

void main() {
  var c = Counter();

  c.increment();

  print(c.getValue());
}
```
<img width="1910" height="952" alt="soal 2" src="https://github.com/user-attachments/assets/de4d3663-6c5f-4226-9d24-c1c392387ef1" />


---
