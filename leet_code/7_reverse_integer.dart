// Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
//
// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
//
//
//
// Example 1:
//
// Input: x = 123
// Output: 321

// You can implement this functionality in Dart by converting the integer to a string,
// reversing the string, handling the sign separately, and then parsing it back to an integer.
import 'dart:math';

int reverse(int x) {
  bool isNegative = x < 0;
  String strX = x.abs().toString();
  String reversedStr = strX.split('').reversed.join();

  int result = int.tryParse(reversedStr) ?? 0;

  if (isNegative) {
    result *= -1;
  }

  // Check if result is within the 32-bit signed integer range
  if (result < -2147483648 || result > 2147483647) {
    return 0;
  }

  return result;
}

void main() {
  int x = 123;
  print(reverse(x)); // Output: 321
  print(Solution().reverse(x));

  x = -123;
  print(reverse(x)); // Output: -321

  x = 1534236469;
  print(reverse(x)); // Output: 0
}

// Another Sol
class Solution {
  int reverse(int x) {
    int reversed = 0;
    bool isNegative = false;
    if (x < 0) {
      x = -x;
      isNegative = true;
    }
    while (x > 0) {
      reversed = (reversed * 10) + x % 10;
      x = x ~/ 10;
    }
    if (reversed > pow(2, 31) - 1 || isNegative && reversed > pow(2, 31))
      return 0;
    return isNegative ? reversed *= -1 : reversed;
  }
}
