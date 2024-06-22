// Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
//
//
//
// Example 1:
//
// Input: nums1 = [1,2,2,1], nums2 = [2,2]
// Output: [2,2]
// Example 2:
//
// Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
// Output: [4,9]
// Explanation: [9,4] is also accepted.
class Solution {
  List<int> intersect(List<int> nums1, List<int> nums2) {
    Map<int, int> counts = {}; // Hash table to store element counts

    // Count occurrences of elements in nums1
    for (var num in nums1) {
      counts[num] = (counts[num] ?? 0) + 1;
    }

    List<int> result = [];

    // Iterate through nums2 and check for intersections
    for (var num in nums2) {
      if (counts.containsKey(num) && counts[num]! > 0) {
        result.add(num);
        counts[num] = counts[num]! - 1;
      }
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();

  List<int> nums1 = [1, 2, 2, 1];
  List<int> nums2 = [2, 2];
  print(solution.intersect(nums1, nums2)); // Output: [2, 2]

  List<int> nums3 = [4, 9, 5];
  List<int> nums4 = [9, 4, 9, 8, 4];
  print(solution.intersect(nums3, nums4)); // Output: [9, 4]
}
