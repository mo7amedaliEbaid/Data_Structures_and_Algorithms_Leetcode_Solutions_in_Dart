// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
// The overall run time complexity should be O(log (m+n)).
// Input: nums1 = [1,3], nums2 = [2]
// Output: 2.00000
// Explanation: merged array = [1,2,3] and median is 2.

// A median is the middle number in a sorted list of numbers (either ascending or descending) used in statistical studies.

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    nums1.addAll(nums2);

    nums1.sort();

    if (nums1.length % 2 != 0) {
      return nums1[nums1.length ~/ 2].toDouble();
    }

    return (nums1[nums1.length ~/ 2].toDouble() +
            nums1[(nums1.length ~/ 2) - 1].toDouble()) /
        2;
  }
}

main() {
  Solution solution = Solution();
  print(solution.findMedianSortedArrays([1, 3], [2]));
}
