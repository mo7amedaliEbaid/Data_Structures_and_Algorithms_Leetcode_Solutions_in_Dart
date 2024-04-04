// Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,4,5,6,7], k = 3
// Output: [5,6,7,1,2,3,4]
// Explanation:
// rotate 1 steps to the right: [7,1,2,3,4,5,6]
// rotate 2 steps to the right: [6,7,1,2,3,4,5]
// rotate 3 steps to the right: [5,6,7,1,2,3,4]
// Example 2:
//
// Input: nums = [-1,-100,3,99], k = 2
// Output: [3,99,-1,-100]
// Explanation:
// rotate 1 steps to the right: [99,-1,-100,3]
// rotate 2 steps to the right: [3,99,-1,-100]
class Solution {
  void rotate(List<int> nums, int k) {
    k %= nums.length; // To handle cases where k is greater than nums.length
    List<int> fPart = nums.sublist(0, nums.length - k);
    List<int> sPart = nums.sublist(nums.length - k, nums.length);
    nums.clear(); // Clear the original list
    nums.addAll([...sPart, ...fPart]); // Add the rotated parts to the original list
    print(nums);
  }
}
main(){
  Solution().rotate([1,2,3,4,5,6,7], 3);
  Solution().rotate([-1,-100,3,99], 2);
}