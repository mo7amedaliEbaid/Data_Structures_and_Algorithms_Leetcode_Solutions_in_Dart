/*
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.*/
/*
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].*/

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i == j) {
          continue;
        } else if (nums[i] + nums[j] == target) {
          return [i, j];
        } else {
          continue;
        }
      }
    }
    return [];
  }
}

main() {
  Solution solution = Solution();
  List<int> output = solution.twoSum([2, 7, 11, 15], 9);
  print(output);
  List<int> nums = [11, 5, 1, 2, 7, 11, 15];
  int target = 9;
  print(twoSum(nums, target)); // Output: [3, 4]
}
// Hash Tables Sol
List<int> twoSum(List<int> nums, int target) {
  Map<int, int> map = {};

  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (map.containsKey(complement)) {
      return [map[complement]!, i];
    }
    map[nums[i]] = i;
    print(map);
  }

  throw ArgumentError('No two sum solution');
}

//In this solution, we iterate through the array nums. For each element, we calculate its complement (the value needed to reach the target) and check if it exists in the map.
// If the complement exists, we return the indices of the current element and its complement.
// Otherwise, we store the current element and its index in the map.