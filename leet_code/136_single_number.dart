// Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//
// You must implement a solution with a linear runtime complexity and use only constant extra space.
//
//
//
// Example 1:
//
// Input: nums = [2,2,1]
// Output: 1
// Example 2:
//
// Input: nums = [4,1,2,1,2]
// Output: 4
// Example 3:
//
// Input: nums = [1]
// Output: 1

class Solution {
  int singleNumber(List<int> nums) {
    int n = nums.length;
    for (int i = 0; i < n - 1; i++) {
      nums[i + 1] = nums[i] ^ nums[i + 1];
    }
    return nums[n - 1];
  }
}

void main() {
  Solution solution = Solution();

  List<int> nums1 = [2, 2, 1];
  print(solution.singleNumber(nums1)); // Output: 1

  List<int> nums2 = [4, 1, 2, 1, 2];
  print(solution.singleNumber(nums2)); // Output: 4
}
// This problem can be effectively solved using the XOR operation.
//
// Here's how the solution works:
//
// Initialize a variable n to store the length of the nums list.
// Iterate through the nums list starting from the first element (index 0) up to the second-to-last element (index n - 2).
// In each iteration:
// Use the XOR (^) operation between the current element nums[i] and the next element nums[i + 1].
// Update the next element nums[i + 1] with the result of the XOR operation.
// This operation effectively XORs all adjacent elements in the list.
// After the loop, the last element of the nums list will contain the single number because all other numbers would have been XORed out
// (canceled) due to appearing twice.

// The XOR (^) operation, also known as the exclusive OR operation,
// is a binary operation that takes two operands and returns true if exactly one of the operands is true.
// In the context of integers, the XOR operation is performed bitwise, meaning it operates on each corresponding bit of the operands.
//
// Here's how the XOR operation works bitwise:
//
// If both bits are the same (either both 0 or both 1), the result is 0.
// If the bits are different (one is 0 and the other is 1), the result is 1.
// In the context of the singleNumber method, the XOR operation is used to cancel out pairs of identical numbers. When two identical numbers are XORed together, the result is 0. Therefore, when XORing all the elements of the list, only the single number (which does not have a pair) will remain.
//
// For example:
//
// 5 ^ 5 results in 0.
// 0 ^ 7 results in 7.
// 7 ^ 5 results in 2.
// In this way, by XORing all the numbers in the list together, the single number can be found.