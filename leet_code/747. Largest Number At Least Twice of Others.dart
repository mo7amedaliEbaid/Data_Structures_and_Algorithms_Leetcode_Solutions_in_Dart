// You are given an integer array nums where the largest integer is unique.
//
// Determine whether the largest element in the array is at least twice as much as every other number in the array.
// If it is, return the index of the largest element, or return -1 otherwise.
//
//
//
// Example 1:
//
// Input: nums = [3,6,1,0]
// Output: 1
// Explanation: 6 is the largest integer.
// For every other number in the array x, 6 is at least twice as big as x.
// The index of value 6 is 1, so we return 1.
// Example 2:
//
// Input: nums = [1,2,3,4]
// Output: -1
// Explanation: 4 is less than twice the value of 3, so we return -1.

class Solution {
  int dominantIndex(List<int> nums) {
    int largest = 0;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[largest]) {
        largest = i;
      }
    }
    for (int i = 0; i < nums.length; i++) {
      if (i != largest && nums[largest] < 2 * nums[i]) {
        return -1;
      }
    }
    return largest;
  }
}
class Solution1 {
  int dominantIndex(List<int> nums) {
    // Create a copy of the original list
    List<int> sortedList = List.from(nums);

    // Sort the copy
    sortedList.sort();

    // Get the largest element from the sorted list
    int dominantValue = sortedList.last;

    // Check if the largest element is at least twice as much as every other number
    for (int i = 0; i < sortedList.length - 1; i++) {
      if (dominantValue / 2 < sortedList[i]) {
        return -1;
      }
    }

    // If the condition is met, return the index of the largest element in the original list
    return nums.indexOf(dominantValue);
  }
}

main(){
  print(Solution().dominantIndex([1,2,3,4]));
  print(Solution().dominantIndex([3,6,1,0]));
}