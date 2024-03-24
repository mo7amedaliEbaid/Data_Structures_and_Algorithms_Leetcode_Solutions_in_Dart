// Given a string s, find the length of the longest substring without repeating characters.
//
//
//
// Example 1:
//
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

int lengthOfLongestSubstring(String s) {
  if (s.isEmpty) return 0;

  int maxLength = 0;
  Map<String, int> charIndexMap = {};

  for (int start = 0, end = 0; end < s.length; end++) {
    String currentChar = s[end];
    if (charIndexMap.containsKey(currentChar)) {
      start = startOfNextSubstring(start, charIndexMap[currentChar]!);
    }
    int currentLength = end - start + 1;
    if (currentLength > maxLength) {
      maxLength = currentLength;
    }
    charIndexMap[currentChar] = end;
  }

  return maxLength;
}

int startOfNextSubstring(int currentStart, int repeatedIndex) {
  return currentStart > repeatedIndex ? currentStart : repeatedIndex + 1;
}

void main() {
  String s = "abcabcbb";
  String s1 = "bbbbb";
  print(lengthOfLongestSubstring(s)); // Output: 3
  print(lengthOfLongestSubstring(s1));
  print(lengthOfLongestSubstring2(s));
  print(lengthOfLongestSubstring2(s1)); // Output: 3
}

int lengthOfLongestSubstring2(String s) {
  List<String> temp = [];
  int result = 0;
  s.split('').forEach((element) {
    if (!temp.contains(element)) {
      temp.add(element);
    } else {
      result = result > temp.length ? result : temp.length;
      temp = [element];
    }
  });
  return result;
}
