// Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
//
// Return the running sum of nums.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,4]
// Output: [1,3,6,10]
// Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

class Solution {
  List<int> runningSum(List<int> nums) {
    List<int> result = [];
    int sum = 0;
    for (var i = 0; i < nums.length; i++) {
      sum += nums[i];
      result.add(sum);
    }
    return result;
  }
}
void main() {
  Solution solution = Solution();

  // Test case
  print(solution.runningSum([1, 2, 3, 4])); // Output: [1, 3, 6, 10]
}