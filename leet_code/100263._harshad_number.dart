// An integer divisible by the sum of its digits is said to be a Harshad number. You are given an integer x. Return the sum of the digits of x if x is a Harshad number, otherwise, return -1.
//
//
//
// Example 1:
//
// Input: x = 18
//
// Output: 9
//
// Explanation:
//
// The sum of digits of x is 9. 18 is divisible by 9. So 18 is a Harshad number and the answer is 9.

class Solution {
  int sumOfTheDigitsOfHarshadNumber(int x) {
    int sum = sumOfDigits(x);
    bool is_divisible = isDivisible(x, sum);
    if (is_divisible == true) {
      return sum;
    } else {
      return -1;
    }
  }

  int sumOfDigits(int number) {
    int sum = 0;
    while (number != 0) {
      sum += number % 10;
      number ~/= 10; // Integer division
    }
    return sum;
  }

  bool isDivisible(int dividend, int divisor) {
    return dividend % divisor == 0;
  }
}
main(){
  print(Solution().sumOfTheDigitsOfHarshadNumber(18));
  print(Solution().sumOfTheDigitsOfHarshadNumber(23));
  print(Solution().sumOfTheDigitsOfHarshadNumber(24));
}