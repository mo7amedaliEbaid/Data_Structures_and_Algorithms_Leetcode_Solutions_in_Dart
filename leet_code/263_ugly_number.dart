// An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
//
// Given an integer n, return true if n is an ugly number.
//
//
//
// Example 1:
//
// Input: n = 6
// Output: true
// Explanation: 6 = 2 × 3
// Example 2:
//
// Input: n = 1
// Output: true
// Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.
// Example 3:
//
// Input: n = 14
// Output: false
// Explanation: 14 is not ugly since it includes the prime factor 7.
// To solve this problem in Dart, you can repeatedly divide the number by 2, 3, and 5 as long as it is divisible by any of these numbers.
// If the number eventually becomes 1 after these divisions, it means all its prime factors are limited to 2, 3, and 5,
// making it an ugly number.
// If at any point it is not divisible by 2, 3, or 5, then it is not an ugly number.
class Solution {
  bool isUgly(int n) {
    if (n <= 0) return false; // Ugly numbers are positive integers

    // Repeat division until n is no longer divisible by 2, 3, or 5
    while (n % 2 == 0) {
      n ~/= 2;
    }
    while (n % 3 == 0) {
      n ~/= 3;
    }
    while (n % 5 == 0) {
      n ~/= 5;
    }

    // If n becomes 1, all its prime factors are limited to 2, 3, and 5
    return n == 1;
  }
}

void main() {
  print(Solution().isUgly(6)); // Output: true
  print(Solution().isUgly(1)); // Output: true
  print(Solution().isUgly(14)); // Output: false
}


// This solution iteratively divides the number by 2, 3, and 5 while it is divisible by them.
// If the number becomes 1 after these divisions, it returns true, indicating that the number is an ugly number.
// If at any point the number is not divisible by 2, 3, or 5, it returns false, indicating that the number is not an ugly number.