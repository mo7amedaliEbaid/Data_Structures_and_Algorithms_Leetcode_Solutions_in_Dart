// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
// P   A   H   N
// A P L S I I G
// Y   I   R
// And then read line by line: "PAHNAPLSIIGYIR"
//
// Write the code that will take a string and make this conversion given a number of rows:
//
// string convert(string s, int numRows);
//
//
// Example 1:
//
// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"

class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1) return s;

    List<String> rows = List.filled(numRows, "");

    int j = 0, d = 1;

    for (int i = 0; i < s.length; i++) {
      rows[j] += s[i];

      if (j == numRows - 1)
        d = -1;
      else if (j == 0) d = 1;

      j += d;
    }

    String res = "";

    for (int i = 0; i < numRows; i++) {
      res += rows[i];
    }

    return res;
  }
}

main() {
  print(Solution().convert("PAYPALISHIRING", 3));
}
