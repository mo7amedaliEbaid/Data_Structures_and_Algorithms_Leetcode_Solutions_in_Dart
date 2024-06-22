// Given a string s consisting of lowercase English letters, return the first letter to appear twice.
//
// Note:
//
// A letter a appears twice before another letter b if the second occurrence of a is before the second occurrence of b.
// s will contain at least one letter that appears twice.
//
//
// Example 1:
//
// Input: s = "abccbaacz"
// Output: "c"
// Explanation:
// The letter 'a' appears on the indexes 0, 5 and 6.
// The letter 'b' appears on the indexes 1 and 4.
// The letter 'c' appears on the indexes 2, 3 and 7.
// The letter 'z' appears on the index 8.
// The letter 'c' is the first letter to appear twice, because out of all the letters the index of its second occurrence is the smallest.
// Example 2:
//
// Input: s = "abcdd"
// Output: "d"
// Explanation:
// The only letter that appears twice is 'd' so we return 'd'.

class Solution {
  String repeatedCharacter(String s) {
    Set<String> sSet = {};
    List<String> sList = s.split('');
    String repeatedChar = '';

    for (var i = 0; i < sList.length; i++) {
      if (sSet.contains(sList[i])) {
        repeatedChar = sList[i];
        break;
      } else {
        sSet.add(sList[i]);
      }
    }

    return repeatedChar;
  }
}

main() {
  String s = "abccbaacz";
  print(Solution().repeatedCharacter(s));
  s = "abcdd";
  print(Solution().repeatedCharacter(s));
  s = "eesll";
  print(Solution().repeatedCharacter(s));
}
