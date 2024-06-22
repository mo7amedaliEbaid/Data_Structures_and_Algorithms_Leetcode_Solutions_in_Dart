// Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.
//
// You must write an algorithm that runs in O(n) time and uses only constant extra space.
//
//
//
// Example 1:
//
// Input: nums = [4,3,2,7,8,2,3,1]
// Output: [2,3]

List<int> findDuplicates(List<int> nums) {
  List<int> duplicates = [];

  for (int i = 0; i < nums.length; i++) {
    while (nums[i] != i + 1) {
      if (nums[i] == nums[nums[i] - 1]) {
        if (!duplicates.contains(nums[i])) {
          duplicates.add(nums[i]);
        }
        break;
      }
      // Swap nums[i] with nums[nums[i] - 1]
      int temp = nums[i];
      nums[i] = nums[temp - 1];
      nums[temp - 1] = temp;
    }
  }

  return duplicates;
}

void main() {
  List<int> nums = [4, 3, 2, 7, 8, 2, 3, 1];
  List<int> result = findDuplicates(nums);
  print("Duplicates: $result");
}
