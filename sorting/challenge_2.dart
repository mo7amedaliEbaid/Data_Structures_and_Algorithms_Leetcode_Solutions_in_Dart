// Here’s a list of randomly distributed elements:
// [4, 2, 5, 1, 3]
// sort the list in dart using selection sort

void selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    // Swap arr[i] and arr[minIndex]
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
}



void main() {
  List<int> elements = [4, 2, 5, 1, 3];
  print("Original list: $elements");

  selectionSort(elements);

  print("Sorted list: $elements");
}
