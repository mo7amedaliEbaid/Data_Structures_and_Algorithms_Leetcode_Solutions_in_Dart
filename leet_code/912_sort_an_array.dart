// Given an array of integers nums, sort the array in ascending order and return it.
//
// You must solve the problem without using any built-in functions in O(nlog(n)) time complexity and with the smallest space complexity possible.
//
//
//
// Example 1:
//
// Input: nums = [5,2,3,1]
// Output: [1,2,3,5]
// Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
// Example 2:
//
// Input: nums = [5,1,1,2,0,0]
// Output: [0,0,1,1,2,5]
// Explanation: Note that the values of nums are not necessairly unique.

// merge sort
/*class Solution {
  List<int> sortArray(List<int> nums) {
    if (nums.length <= 1) {
      return nums;
    }

    List<int> merge(List<int> left, List<int> right) {
      List<int> merged = [];
      int leftIndex = 0, rightIndex = 0;

      while (leftIndex < left.length && rightIndex < right.length) {
        if (left[leftIndex] < right[rightIndex]) {
          merged.add(left[leftIndex]);
          leftIndex++;
        } else {
          merged.add(right[rightIndex]);
          rightIndex++;
        }
      }

      merged.addAll(left.sublist(leftIndex));
      merged.addAll(right.sublist(rightIndex));

      return merged;
    }

    int mid = nums.length ~/ 2;
    List<int> left = sortArray(nums.sublist(0, mid));
    List<int> right = sortArray(nums.sublist(mid));

    return merge(left, right);
  }
}

void main() {
  List<int> nums1 = [5, 2, 3, 1];
  print(Solution().sortArray(nums1)); // Output: [1, 2, 3, 5]

  List<int> nums2 = [5, 1, 1, 2, 0, 0];
  print(Solution().sortArray(nums2)); // Output: [0, 0, 1, 1, 2, 5]
}*/
// heap sort

class Solution {
  List<int> sortArray(List<int> nums) {
    void heapify(List<int> arr, int n, int i) {
      int largest = i; // Initialize largest as root
      int left = 2 * i + 1; // left = 2*i + 1
      int right = 2 * i + 2; // right = 2*i + 2

      // If left child is larger than root
      if (left < n && arr[left] > arr[largest]) {
        largest = left;
      }

      // If right child is larger than largest so far
      if (right < n && arr[right] > arr[largest]) {
        largest = right;
      }

      // If largest is not root
      if (largest != i) {
        int swap = arr[i];
        arr[i] = arr[largest];
        arr[largest] = swap;

        // Recursively heapify the affected sub-tree
        heapify(arr, n, largest);
      }
    }

    // Build heap (rearrange array)
    int n = nums.length;
    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      heapify(nums, n, i);
    }

    // One by one extract an element from heap
    for (int i = n - 1; i > 0; i--) {
      // Move current root to end
      int temp = nums[0];
      nums[0] = nums[i];
      nums[i] = temp;

      // call max heapify on the reduced heap
      heapify(nums, i, 0);
    }

    return nums;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.sortArray([5, 2, 3, 1])); // Output: [1, 2, 3, 5]
}

