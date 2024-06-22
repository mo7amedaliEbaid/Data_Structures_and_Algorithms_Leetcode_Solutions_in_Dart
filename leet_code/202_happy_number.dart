// Write an algorithm to determine if a number n is happy.
//
// A happy number is a number defined by the following process:
//
// Starting with any positive integer, replace the number by the sum of the squares of its digits.
// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy.
// Return true if n is a happy number, and false if not.
//
//
//
// Example 1:
//
// Input: n = 19
// Output: true
// Explanation:
// 12 + 92 = 82
// 82 + 22 = 68
// 62 + 82 = 100
// 12 + 02 + 02 = 1
// Example 2:
//
// Input: n = 2
// Output: false

class Solution {
  bool isHappy(int n) {
    // Keep track of seen numbers to detect cycles
    Set<int> seen = Set<int>();

    // Iterate until we either find 1 (happy number) or enter a cycle
    while (n != 1) {
      // If we've seen this number before, it means we've entered a cycle
      if (seen.contains(n)) {
        return false;
      }

      // Add the current number to the set of seen numbers
      seen.add(n);

      // Calculate the sum of squares of digits
      int sum = 0;
      while (n > 0) {
        int digit = n % 10;
        sum += digit * digit;
        n ~/= 10;
      }

      // Update n with the sum of squares of digits for the next iteration
      n = sum;
    }

    // If n reaches 1, it's a happy number
    return true;
  }
}

void main() {
  print(Solution().isHappy(19)); // Output: true
  print(Solution().isHappy(2));  // Output: false
}

