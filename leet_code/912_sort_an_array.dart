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
class Solution {
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
}
