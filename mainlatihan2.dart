import 'latihan2.dart';

void main() {
  List<Mahasiswa> mahasiswaList = [
    Mahasiswa('12345', 'Ichaa'),
    Mahasiswa('12347', 'Inka'),
    Mahasiswa('12346', 'Rahma'),
    Mahasiswa('12344', 'Shapiraa'),
  ];

  print('Sebelum diurutkan:');
  Latihan.display(mahasiswaList);

  Latihan.selectionSort(mahasiswaList);

  print('Setelah diurutkan:');
  Latihan.display(mahasiswaList);
}
