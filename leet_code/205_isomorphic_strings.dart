// Given two strings s and t, determine if they are isomorphic.
//
// Two strings s and t are isomorphic if the characters in s can be replaced to get t.
//
// All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.
//
//
//
// Example 1:
//
// Input: s = "egg", t = "add"
// Output: true
// Example 2:
//
// Input: s = "foo", t = "bar"
// Output: false
// Example 3:
//
// Input: s = "paper", t = "title"
// Output: true

bool areIsomorphic(String s, String t) {
  if (s.length != t.length) return false;

  Map<String, String> mapping = {};
  Set<String> mappedCharacters = {};

  for (int i = 0; i < s.length; i++) {
    String charS = s[i];
    String charT = t[i];

    if (mapping.containsKey(charS)) {
      if (mapping[charS] != charT) {
        return false; // Inconsistent mapping
      }
    } else {
      if (mappedCharacters.contains(charT)) {
        return false; // charT is already mapped to another charS
      }
      mapping[charS] = charT;
      mappedCharacters.add(charT);
    }
  }

  return true;
}

void main() {
  print(areIsomorphic("egg", "add")); // Output: true
  print(areIsomorphic("foo", "bar")); // Output: false
  print(areIsomorphic("paper", "title")); // Output: true
}
