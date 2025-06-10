// You are given a string s consisting of lowercase English letters.
//
// Your task is to find the maximum difference diff = a1 - a2 between the frequency of characters a1 and a2 in
// the string such that:
//
// a1 has an odd frequency in the string.
// a2 has an even frequency in the string.
// Return this maximum difference.
//
//
//
// Example 1:
//
// Input: s = "aaaaabbc"
//
// Output: 3
//
// Explanation:
//
// The character 'a' has an odd frequency of 5, and 'b' has an even frequency of 2.
// The maximum difference is 5 - 2 = 3.
// Example 2:
//
// Input: s = "abcabcab"
//
// Output: 1
//
// Explanation:
//
// The character 'a' has an odd frequency of 3, and 'c' has an even frequency of 2.
// The maximum difference is 3 - 2 = 1.
//
//
// Constraints:
//
// 3 <= s.length <= 100
// s consists only of lowercase English letters.
// s contains at least one character with an odd frequency and one with an even frequency.
class Solution {
  int maxDifference(String s) {
    Map<String, int> freqMap = {};

    // Count character frequencies
    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      freqMap[char] = (freqMap[char] ?? 0) + 1;
    }

    // Separate frequencies into odd and even
    List<int> oddFreqs = [];
    List<int> evenFreqs = [];

    for (int freq in freqMap.values) {
      if (freq % 2 == 1) {
        oddFreqs.add(freq);
      } else {
        evenFreqs.add(freq);
      }
    }

    // Ensure there's at least one odd and one even frequency
    if (oddFreqs.isEmpty || evenFreqs.isEmpty) return 0;

    // Find max odd frequency without reduce
    int maxOdd = oddFreqs[0];
    for (int i = 1; i < oddFreqs.length; i++) {
      if (oddFreqs[i] > maxOdd) {
        maxOdd = oddFreqs[i];
      }
    }

    // Find min even frequency without reduce
    int minEven = evenFreqs[0];
    for (int i = 1; i < evenFreqs.length; i++) {
      if (evenFreqs[i] < minEven) {
        minEven = evenFreqs[i];
      }
    }

    return maxOdd - minEven;
  }
}
