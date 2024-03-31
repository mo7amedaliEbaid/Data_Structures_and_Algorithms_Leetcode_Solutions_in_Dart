// Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
//
// We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
//
// You must solve this problem without using the library's sort function.
//
//
//
// Example 1:
//
// Input: nums = [2,0,2,1,1,0]
// Output: [0,0,1,1,2,2]


// the Dutch National Flag algorithm
List<int> sortColors(List<int> nums) {
  int left = 0;
  int right = nums.length - 1;
  int i = 0;

  while (i <= right) {
    if (nums[i] == 0) {
      swap(nums, i, left);
      left++;
      i++;
    } else if (nums[i] == 2) {
      swap(nums, i, right);
      right--;
    } else {
      i++;
    }
  }
  return nums;
}

void swap(List<int> nums, int i, int j) {
  int temp = nums[i];
  nums[i] = nums[j];
  nums[j] = temp;
}

main() {
  List<int> nums = [2, 0, 2, 1, 1, 0];
  print(sortColors(nums));
}
