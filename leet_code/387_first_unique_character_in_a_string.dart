// Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
//
//
//
// Example 1:
//
// Input: s = "leetcode"
// Output: 0
// Example 2:
//
// Input: s = "loveleetcode"
// Output: 2
// Example 3:
//
// Input: s = "aabb"
// Output: -1

class Solution {
  int firstUniqChar(String s) {
    Map<String, int> charCount = {};

    // Count occurrences of each character
    for (var char in s.split('')) {
      charCount[char] = (charCount[char] ?? 0) + 1;
    }

    // Find the index of the first non-repeating character
    for (var i = 0; i < s.length; i++) {
      if (charCount[s[i]] == 1) {
        return i;
      }
    }

    return -1; // If no non-repeating character found
  }
}

void main() {
  print(Solution().firstUniqChar("leetcode")); // Output: 0
}
