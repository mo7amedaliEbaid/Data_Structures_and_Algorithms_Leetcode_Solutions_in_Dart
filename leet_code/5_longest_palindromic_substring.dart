// Given a string s, return the longest palindromic substring in s.
//
//
//
// Example 1:
//
// Input: s = "babad"
// Output: "bab"
// Explanation: "aba" is also a valid answer.

class Solution {
  bool isPalin(String s) {
    return s == s.split('').reversed.join();
  }

  String longestPalindrome(String s) {
    String biggestPalin = s[0];
    int step = biggestPalin.length ~/ 2;

    for (int center = 1; center < s.length - 1; center++) {
      int leftBound = center - (step + 1);
      int rightBound = center + (step + 1);

      while (leftBound > -1 && rightBound < s.length) {
        final possiblePalin = s.substring(leftBound, rightBound + 1);

        if (isPalin(possiblePalin)) {
          biggestPalin = possiblePalin;
          step = possiblePalin.length ~/ 2;
          leftBound -= 1;
          rightBound += 1;
        } else {
          break;
        }
      }
    }

    for (int center = step; center < s.length - step - 1; center++) {
      int leftBound = center - step;
      int rightBound = center + (step + 1);

      while (leftBound > -1 && rightBound < s.length) {
        final possiblePalin = s.substring(leftBound, rightBound + 1);

        if (isPalin(possiblePalin)) {
          biggestPalin = possiblePalin;
          step = possiblePalin.length ~/ 2;
          leftBound -= 1;
          rightBound += 1;
        } else {
          break;
        }
      }
    }

    return biggestPalin;
  }
}

main() {
  Solution solution = Solution();
  print(solution.longestPalindrome("babad"));
  print(longestPalindrome('babad')); // Output: "bab" or "aba"

  String s = "cbbd";
  print(longestPalindrome(s));
}

String longestPalindrome(String s) {
  if (s.isEmpty) return '';

  int start = 0;
  int maxLength = 1;
  int n = s.length;

  bool isPalindrome(int left, int right) {
    while (left < right) {
      if (s[left] != s[right]) return false;
      left++;
      right--;
    }
    return true;
  }

  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      if (j - i + 1 > maxLength && isPalindrome(i, j)) {
        start = i;
        maxLength = j - i + 1;
      }
    }
  }

  return s.substring(start, start + maxLength);
}
