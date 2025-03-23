import 'dart:io';
import 'dart:math';

void main() {
  List<int> data = List.generate(100, (_) => Random().nextInt(1000));
  List<int> sortedData;
  Stopwatch stopwatch = Stopwatch();

  print("ALGORITMA SORTING");
  print("1. Insertion");
  print("2. Selection");
  print("3. Bubble");
  print("4. Shell");
  print("5. Quick");
  print("6. Merge");
  stdout.write("Pilihan: ");
  int? algoritma = int.parse(stdin.readLineSync()!);

  print("\n1. Ascending");
  print("2. Descending");
  stdout.write("Pilihan: ");
  int? arah = int.parse(stdin.readLineSync()!);

  stopwatch.start();
  switch (algoritma) {
    case 1:
      sortedData = insertionSort(List.from(data), arah == 1);
      break;
    case 2:
      sortedData = selectionSort(List.from(data), arah == 1);
      break;
    case 3:
      sortedData = bubbleSort(List.from(data), arah == 1);
      break;
    case 4:
      sortedData = shellSort(List.from(data), arah == 1);
      break;
    case 5:
      sortedData = quickSort(List.from(data), arah == 1);
      break;
    case 6:
      sortedData = mergeSort(List.from(data), arah == 1);
      break;
    default:
      print("Pilihan tidak valid.");
      return;
  }
  stopwatch.stop();

  print("\nWaktu: ${stopwatch.elapsedMilliseconds} ms");
  // print("Data setelah diurutkan: $sortedData"); // Uncomment untuk melihat hasil pengurutan
}

List<int> insertionSort(List<int> arr, bool ascending) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && (ascending ? arr[j] > key : arr[j] < key)) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

List<int> selectionSort(List<int> arr, bool ascending) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minMaxIndex = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (ascending ? arr[j] < arr[minMaxIndex] : arr[j] > arr[minMaxIndex]) {
        minMaxIndex = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[minMaxIndex];
    arr[minMaxIndex] = temp;
  }
  return arr;
}

List<int> bubbleSort(List<int> arr, bool ascending) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (ascending ? arr[j] > arr[j + 1] : arr[j] < arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

List<int> shellSort(List<int> arr, bool ascending) {
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j;
      for (j = i; j >= gap && (ascending ? arr[j - gap] > temp : arr[j - gap] < temp); j -= gap) {
        arr[j] = arr[j - gap];
      }
      arr[j] = temp;
    }
  }
  return arr;
}

List<int> quickSort(List<int> arr, bool ascending) {
  if (arr.length <= 1) {
    return arr;
  }
  int pivot = arr[0];
  List<int> left = [];
  List<int> right = [];
  for (int i = 1; i < arr.length; i++) {
    if (ascending ? arr[i] < pivot : arr[i] > pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }
  return [...quickSort(left, ascending), pivot, ...quickSort(right, ascending)];
}

List<int> mergeSort(List<int> arr, bool ascending) {
  if (arr.length <= 1) {
    return arr;
  }
  int mid = arr.length ~/ 2;
  List<int> left = mergeSort(arr.sublist(0, mid), ascending);
  List<int> right = mergeSort(arr.sublist(mid), ascending);
  return merge(left, right, ascending);
}

List<int> merge(List<int> left, List<int> right, bool ascending) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (ascending ? left[i] < right[j] : left[i] > right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }
  return [...result, ...left.sublist(i), ...right.sublist(j)];
}
