// Given an array nums of size n, return the majority element.
//
// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
//
//
//
// Example 1:
//
// Input: nums = [3,2,3]
// Output: 3
// Example 2:
//
// Input: nums = [2,2,1,1,1,2,2]
// Output: 2


//Approach 1: Sorting
// Intuition:
// The intuition behind this approach is that if an element occurs more than n/2 times in the array (where n is the size of the array),
// it will always occupy the middle position when the array is sorted. Therefore, we can sort the array and return the element at index n/2.
class Solution {
  int majorityElement(List<int> nums) {
    List<int> sortedNums=nums..sort();
    return sortedNums[nums.length~/2];
  }
}


main(){
  print(Solution().majorityElement([3,2,3]));
  print(Solution().majorityElement([2,2,1,1,1,2,2]));
}