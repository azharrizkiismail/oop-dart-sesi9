class StringUtils {
  static String capitalize(String text) {
    if (text.isEmpty) return text;

    return text[0].toUpperCase() + text.substring(1);
  }

  static bool isEmail(String text) {
    return text.contains('@');
  }
}

// Solusi dengan Extension Methods
extension BasicStringExtension on String {
  String capitalizeText() {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }

  bool isEmailText() {
    return contains('@');
  }
}

// Sintaks Extension Methods
extension NumberExtension on int {
  int square() {
    return this * this;
  }

  int cube() {
    return this * this * this;
  }
}

// Tipe yang Bisa Di-extend
extension StringTypeExtension on String {
  String reverse() {
    return split('').reversed.join();
  }
}

extension IntTypeExtension on int {
  bool isEvenNumber() {
    return this % 2 == 0;
  }
}

extension ListTypeExtension on List {
  int totalItems() {
    return length;
  }
}

// Extension untuk Null Safety
extension NullableStringExtension on String? {
  String orEmpty() {
    return this ?? '';
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  String withDefault(String defaultValue) {
    return this ?? defaultValue;
  }
}

// Generic Extensions
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

// Unnamed Extensions
extension on DateTime {
  String get toYYYYMMDD {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }
}

// Konflik Nama Extension
extension StringExtensionA on String {
  String capitalizeA() {
    return toUpperCase();
  }
}

extension StringExtensionB on String {
  String capitalizeB() {
    return 'Hello $this';
  }
}

// Extension untuk Custom Classes
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

// Praktik 1
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

// Praktik 2
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
  print('=== Masalah Tanpa Extension Methods ===');
  var name = 'john';
  print(StringUtils.capitalize(name));
  print(StringUtils.isEmail('test@mail.com'));

  print('\n=== Solusi dengan Extension Methods ===');
  print(name.capitalizeText());
  print('test@mail.com'.isEmailText());

  print('\n=== Sintaks Extension Methods ===');
  int number = 5;
  print(number.square());
  print(number.cube());

  print('\n=== Tipe yang Bisa Di-extend ===');
  print('Dart'.reverse());
  print(10.isEvenNumber());
  print(['Apple', 'Banana', 'Orange'].totalItems());

  print('\n=== Extension untuk Null Safety ===');
  String? nama;
  print(nama.orEmpty());
  print(nama.isNullOrEmpty);
  print(nama.withDefault('Guest'));

  print('\n=== Generic Extensions ===');
  var numbers = [1, 2, 3, 4, 5, 6, 7];
  print(numbers.getOrNull(2));
  print(numbers.chunk(3));
  print([1, 2, 2, 3, 3].distinct());

  print('\n=== Unnamed Extensions ===');
  var today = DateTime.now();
  print(today.toYYYYMMDD);
  print(today.startOfDay);

  print('\n=== Konflik Nama Extension ===');
  String text = 'dart';
  print(text.capitalizeA());
  print(text.capitalizeB());

  print('\n=== Extension untuk Custom Classes ===');
  var mahasiswa = Mahasiswa('Azhar Rizki', 3.75);
  mahasiswa.tampilkanInfo();

  print('\n=== Praktik 1 ===');
  var price = 1500000;
  print(price.toRupiah());
  print(5.isBetween(1, 10));
  print(2.power(3));

  print('\n=== Praktik 2 ===');
  var email = 'test@example.com';
  var age = 25;
  var password = 'Pass1234';

  print(email.isEmail);
  print(age.isAdultAge);
  print(password.isStrongPassword);
  print(10.isEven);
}
