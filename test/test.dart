// 217. Contains Duplicate
// Solved
// Easy
// Topics
// premium lock icon
// Companies
// Given an integer array nums, return true if any value appears at least twice in the array,
// and return false if every element is distinct.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,1]
//
// Output: true
//
// Explanation:
//
// The element 1 occurs at the indices 0 and 3.
//
// Example 2:
//
// Input: nums = [1,2,3,4]
//
// Output: false
//
// Explanation:
//
// All elements are distinct.
//
// Example 3:
//
// Input: nums = [1,1,1,3,3,4,3,2,4,2]
//
// Output: true
//
//
//
// Constraints:
//
// 1 <= nums.length <= 105
// -109 <= nums[i] <= 109

/*class Solution {
  bool containsDuplicate(List<int> nums) {
    Set<num> seen = {};
    for (var i in nums) {
      if (seen.contains(i)) {
        return true;
      } else {
        seen.add(i);
      }
    }
    return false;
  }
}*/
import '../leet_code/242_valid_anagram.dart';
/*class Solution {
  bool isAnagram(String s, String t) {
    Map<String, int> charsMap = {};
    if (s.length != t.length) return false;
    for (var i in s.split('')) {
      if (charsMap.containsKey(i)) {
        charsMap[i] = (charsMap[i] ?? 0) + 1;
      } else {
        charsMap[i] = 1;
      }
    }
    for (var j in t.split('')) {
      if (charsMap.containsKey(j)) {
        charsMap[j] = (charsMap[j] ?? 0) - 1;
      } else {
        return false;
      }
    }

    for (var k in charsMap.values) {
      if (k != 0) {
        return false;
      } else {
        continue;
      }
    }

    return true;
  }
}*/

/*class Solution {
  bool isAnagram(String s, String t) {
    Map<String, int> chars = {};
    if (s.length != t.length) {
      return false;
    }
    for (var i = 0; i < s.length; i++) {
      chars[s] = (chars[s] ?? 0) + 1;
    }else {
        charsMap[i] = 1;
      }
    for (var j = 0; j < t.length; j++) {
      if (!chars.containsKey(t[j])) {
        return false;
      } else {
        chars[t] = chars[t] ?? 0 - 1;
      }
      for (var k in chars.values) {
        if (k == 0) {
          return true;
        }
      }
    }
    return false;
  }
}*/
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) {
      var remain = target - nums[i];
      if (map.containsKey(remain)) {
        return [map[remain]!, i];
      } else {
        map[nums[i]] = i;
      }
    }
    return [];
  }
}
