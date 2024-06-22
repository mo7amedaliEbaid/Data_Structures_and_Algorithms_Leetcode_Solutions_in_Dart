// Given an unsorted integer array nums. Return the smallest positive integer that is not present in nums.
//
// You must implement an algorithm that runs in O(n) time and uses O(1) auxiliary space.
//
//
//
// Example 1:
//
// Input: nums = [1,2,0]
// Output: 3
// Explanation: The numbers in the range [1,2] are all in the array.
// Example 2:
//
// Input: nums = [3,4,-1,1]
// Output: 2
// Explanation: 1 is in the array but 2 is missing.
// Example 3:
//
// Input: nums = [7,8,9,11,12]
// Output: 1
// Explanation: The smallest positive integer 1 is missing.
class Solution {
  int firstMissingPositive(List<int> nums) {
    var val = 0;
    var count = 1;
    nums.sort();
    var index = 0;

    for (var i = 0; i < nums.length; i++) {
      if (nums[i] > 0) {
        index = i;
        break;
      }
    }

    if (nums.length == 1) {
      val = nums[0] != 1 ? 1 : 2;
    } else {
      for (var i = index; i < nums.length; i++) {
        if (nums[i] != count) {
          val = count;
          break;
        }
        if (i < nums.length - 1 && nums[i] != nums[i + 1]) {
          ++count;
        }
      }
      if (val == 0) {
        val = nums[nums.length - 1] + 1;
      }
    }
    return val;
  }
}
