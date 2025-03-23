import 'latihan1.dart';
 void main() {
  List<Mahasiswa> arr8 = [
    Mahasiswa("02", "Budi"),
    Mahasiswa("01", "Andi"),
    Mahasiswa("04", "Udin"),
    Mahasiswa("03", "Candra"),
  ];
  print('Data Sebelum Pengurutan:');
  Latihan.display(arr8);
  DateTime start = DateTime.now();
  Latihan.insertionSort(arr8);
  Duration elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Pengurutan:');
  Latihan.display(arr8);
  print('Waktu: ${elapsedTime.inMilliseconds} ms');
}
