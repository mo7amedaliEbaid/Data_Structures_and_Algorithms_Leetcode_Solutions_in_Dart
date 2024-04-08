// A school is trying to take an annual photo of all the students. The students are asked to stand in a single file line in non-decreasing order by height. Let this ordering be represented by the integer array expected where expected[i] is the expected height of the ith student in line.
//
// You are given an integer array heights representing the current order that the students are standing in. Each heights[i] is the height of the ith student in line (0-indexed).
//
// Return the number of indices where heights[i] != expected[i].
//
//
//
// Example 1:
//
// Input: heights = [1,1,4,2,1,3]
// Output: 3
// Explanation:
// heights:  [1,1,4,2,1,3]
// expected: [1,1,1,2,3,4]
// Indices 2, 4, and 5 do not match.
// Example 2:
//
// Input: heights = [5,1,2,3,4]
// Output: 5
// Explanation:
// heights:  [5,1,2,3,4]
// expected: [1,2,3,4,5]
// All indices do not match.

class Solution {
  int heightChecker(List<int> heights) {
    List<int> expected = List.from(heights);
    expected.sort(); // Sort the expected heights in non-decreasing order

    int count = 0;

    // Compare sorted heights with expected
    for (int i = 0; i < heights.length; i++) {
      if (heights[i] != expected[i]) {
        count++;
      }
    }

    return count;
  }
}

void main() {
  Solution solution = Solution();
  List<int> heights = [1, 1, 4, 2, 1, 3];
  print(solution.heightChecker(heights)); // Output: 3
}
