// You are given an integer array nums. You are initially positioned at the array's first index,
// and each element in the array represents your maximum jump length at that position.
//
// Return true if you can reach the last index, or false otherwise.
//
//
//
// Example 1:
//
// Input: nums = [2,3,1,1,4]
// Output: true
// Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

class Solution {
  bool canJump(List<int> nums) {
    if (nums[0] >= nums.length - 1) return true;
    int n = nums[0], j = 0, cr = 0;
    for (int i = 1; i <= n; i++) {
      if (nums[i] >= nums[cr] - j) {
        j = -1;
        n = nums[i] + i;
        cr = i;
        if (n >= nums.length - 1) return true;
      }
      j++;
    }
    return false;
  }
}
