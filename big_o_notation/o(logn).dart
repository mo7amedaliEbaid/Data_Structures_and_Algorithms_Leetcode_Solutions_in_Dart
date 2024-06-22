int binarySearch(List<int> array, int target) {
  int low = 0;
  int high = array.length - 1;

  while (low <= high) {
    int mid = low + ((high - low) ~/ 2);
    int midValue = array[mid];

    if (midValue == target) {
      return mid; // Target found
    } else if (midValue < target) {
      low = mid + 1; // Continue searching in the right half
    } else {
      high = mid - 1; // Continue searching in the left half
    }
  }

  return -1; // Target not found
}

void main() {
  List<int> sortedArray = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
  int target = 11;

  int index = binarySearch(sortedArray, target);
  if (index != -1) {
    print('Target $target found at index $index.');
  } else {
    print('Target $target not found.');
  }
}
// In this example:
//
// We have a sorted array sortedArray and a target value target.
// The binarySearch function searches for the target value in the array.
// It repeatedly divides the search interval in half until the target is found or the search interval becomes empty.
// At each step, the search interval is halved, leading to O(log n) time complexity.
// As the size of the sorted array doubles,
// the number of iterations required by binary search increases by a constant factor due to the logarithmic nature of the algorithm.
// This demonstrates the O(log n) time complexity characteristic.