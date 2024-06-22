// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
// typically using all the original letters exactly once.
//
//
//
// Example 1:
//
// Input: s = "anagram", t = "nagaram"
// Output: true
// Example 2:
//
// Input: s = "rat", t = "car"
// Output: false

class Solution {
  bool isAnagram(String s, String t) {
    List<String> sList = s.split('')..sort();
    List<String> tList = t.split('')..sort();
    bool isAnagram = false;
    if (sList.length != tList.length) {
      isAnagram = false;
    } else {
      for (var i = 0; i < sList.length; i++) {
        if (sList[i] != tList[i]) {
          isAnagram = false;
          break;
        } else {
          isAnagram = true;
        }
      }
    }
    return isAnagram;
  }
}

main() {
  print(Solution().isAnagram("anagram", "nagaram"));
  print(Solution().isAnagram("anagram", "nagaam"));
  print(Solution().isAnagram("anagram", "nagaaml"));
  String s = "anagaml";
  String t = "nagaram";
  print(isAnagram(s, t));
}
// Hash Tables Sol
bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;

  Map<String, int> count = {};

  for (int i = 0; i < s.length; i++) {
    count[s[i]] = (count[s[i]] ?? 0) + 1;
    count[t[i]] = (count[t[i]] ?? 0) - 1;
  }

  for (int value in count.values) {
    if (value != 0) return false;
  }

  return true;
}



