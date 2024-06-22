// Here’s a list of randomly distributed elements:
// [4, 2, 5, 1, 3]
// sort the list in dart using insertion sort

void insertionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 1; i < n; ++i) {
    int key = arr[i];
    int j = i - 1;

    /* Move elements of arr[0..i-1], that are
       greater than key, to one position ahead
       of their current position */
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

void main() {
  List<int> elements = [4, 2, 5, 1, 3];
  print("Original list: $elements");

  insertionSort(elements);

  print("Sorted list: $elements");
}
