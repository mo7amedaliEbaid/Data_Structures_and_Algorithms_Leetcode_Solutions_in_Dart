// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
//
// Given a string s, return true if it is a palindrome, or false otherwise.
//
//
//
// Example 1:
//
// Input: s = "A man, a plan, a canal: Panama"
// Output: true
// Explanation: "amanaplanacanalpanama" is a palindrome.
// Example 2:
//
// Input: s = "race a car"
// Output: false
// Explanation: "raceacar" is not a palindrome.
// Example 3:
//
// Input: s = " "
// Output: true
// Explanation: s is an empty string "" after removing non-alphanumeric characters.
// Since an empty string reads the same forward and backward, it is a palindrome.

class Solution {
  bool isPalindrome(String s) {
    if (s.isEmpty) return true;
    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      while (left < right && !isAlphaNumaric(s[left])) left++;
      while (left < right && !isAlphaNumaric(s[right])) right--;

      if (s[left].toLowerCase() != s[right].toLowerCase()) {
        return false;
      } else {
        left++;
        right--;
      }
    }
    return true;
  }

  bool isAlphaNumaric(String char) {
    if (char.length != 1) return false;
    int ascii = char.codeUnitAt(0);
    int zeroAcscii = "0".codeUnitAt(0);
    int nineAcscii = "9".codeUnitAt(0);
    int aAcscii = "a".codeUnitAt(0);
    int zAcscii = "z".codeUnitAt(0);
    int AAcscii = "A".codeUnitAt(0);
    int ZAcscii = "Z".codeUnitAt(0);
    return ((zeroAcscii <= ascii && ascii <= nineAcscii) ||
        (aAcscii <= ascii && ascii <= zAcscii) ||
        (AAcscii <= ascii && ascii <= ZAcscii));
  }
}
