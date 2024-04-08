// Here’s a list of randomly distributed elements:
// [4, 2, 5, 1, 3]
// sort the list in dart using bubble sort

void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Swap arr[j] and arr[j + 1]
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> elements = [4, 2, 5, 1, 3];
  print("Original list: $elements");

  bubbleSort(elements);

  print("Sorted list: $elements");
}
