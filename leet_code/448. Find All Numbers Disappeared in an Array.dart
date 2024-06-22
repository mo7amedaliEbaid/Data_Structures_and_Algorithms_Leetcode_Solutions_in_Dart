// Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.
//
//
//
// Example 1:
//
// Input: nums = [4,3,2,7,8,2,3,1]
// Output: [5,6]
// Example 2:
//
// Input: nums = [1,1]
// Output: [2]
class Solution {
  List<int> findDisappearedNumbers(List<int> nums) {
    List<int> completeList = List<int>.generate(nums.length, (index) => index + 1);
    List<int> missingList = [];

    for (var i = 0; i < nums.length; i++) {
      completeList[nums[i] - 1] = 0; // Mark the corresponding index as visited
    }

    for (var j = 0; j < completeList.length; j++) {
      if (completeList[j] != 0) {
        missingList.add(completeList[j]);
      }
    }

    return missingList;
  }
}
