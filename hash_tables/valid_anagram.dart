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
bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;

  Map<String, int> count = {};

  for (int i = 0; i < s.length; i++) {
    count[s[i]] = (count[s[i]] ?? 0) + 1;
    count[t[i]] = (count[t[i]] ?? 0) - 1;
    print(count);
  }

  for (int value in count.values) {
    if (value != 0) return false;
  }

  return true;
}

void main() {
  String s = "anagram";
  String t = "nagaram";
  print(isAnagram(s, t)); // Output: true
}
