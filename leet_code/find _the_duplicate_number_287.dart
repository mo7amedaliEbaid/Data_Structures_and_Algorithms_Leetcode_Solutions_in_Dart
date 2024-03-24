// Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
//
// There is only one repeated number in nums, return this repeated number.
//
// You must solve the problem without modifying the array nums and uses only constant extra space.
//
//
//
// Example 1:
//
// Input: nums = [1,3,4,2,2]
// Output: 2

int findDuplicate(List<int> nums) {
  // Initialize slow and fast pointers
  int slow = nums[0];
  int fast = nums[0];

  // Move pointers until they meet
  do {
    slow = nums[slow];
    fast = nums[nums[fast]];
  } while (slow != fast);

  // Reset one pointer to the start and move both until they meet again
  slow = nums[0];
  while (slow != fast) {
    slow = nums[slow];
    fast = nums[fast];
  }

  // Return the repeated number
  return slow;
}

void main() {
  List<int> nums = [1, 3, 4, 2, 2];
  print(findDuplicate(nums)); // Output: 2
}
