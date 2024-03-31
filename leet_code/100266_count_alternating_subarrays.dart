// You are given a binary array nums.
//
// We call a subarray alternating if no two adjacent elements in the subarray have the same value.
//
// Return the number of alternating subarrays in nums.
//
//
//
// Example 1:
//
// Input: nums = [0,1,1,1]
//
// Output: 5
//
// Explanation:
//
// The following subarrays are alternating: [0], [1], [1], [1], and [0,1].

class Solution {
  int countAlternatingSubarrays(List<int> nums) {
    int count = 0;

    for (int i = 0; i < nums.length; i++) {
      // Start a new alternating subarray
      int j = i;
      // Count the length of the alternating subarray
      while (j + 1 < nums.length && nums[j] != nums[j + 1]) {
        j++;
      }
      // Add the number of subarrays ending at position j
      count += (j - i + 1) * (j - i + 2) ~/ 2;
      // Move i to j to continue from the next non-alternating element
      i = j;
    }

    return count;
  }
}

void main() {
  Solution solution = Solution();
  List<int>  nums = [1,0,1,0];
  print(solution.countAlternatingSubarrays(nums)); // Output: 5
}
