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

  /* int sumOfDigits(int number) {
    int sum = 0;
    String numberAsString = number.toString();

    for (int i = 0; i < numberAsString.length; i++) {
      sum += int.parse(numberAsString[i]);
    }

    return sum;
  }*/

  bool isDivisible(int dividend, int divisor) {
    return dividend % divisor == 0;
  }
}

// In Dart, number % 10 calculates the remainder when number is divided by 10. This operation is called the modulus operator.
//
// So, number % 10 returns the last digit of the number number. For example:
//
// If number is 123, then number % 10 would be 3.
// If number is 456, then number % 10 would be 6.
// If number is 789, then number % 10 would be 9.
// The expression sum += number % 10 adds the last digit of number to the variable sum. It's a shorthand notation
// for sum = sum + (number % 10). This is often used when you want to extract the digits of a number one by one for further processing.

/*
This function, sumOfDigits, calculates the sum of the digits of a given integer number. Here's how it works:

Initialize variables:
sum is initialized to 0. This variable will hold the sum of the digits of the number.
While loop:
The function enters a while loop, which continues as long as number is not equal to 0.
Inside the loop, the function performs the following steps:
Extract the last digit:
number % 10 calculates the last digit of number. It does so by taking the remainder when number is divided by 10.
This operation gives us the last digit of the number.
Update the sum:
The last digit obtained in the previous step is added to the variable sum. This updates the running total sum of the digits.
Remove the last digit:
number ~/= 10 (integer division) divides number by 10, effectively removing the last digit.
This operation shifts all digits one place to the right, effectively removing the last digit from the number. For instance,
if number is 123, after this operation, number becomes 12.
Repeat until number becomes 0:
The loop continues until number becomes 0, effectively extracting all digits from the original number one by one.
Return the sum:
Once the loop completes and number becomes 0, the function returns the final sum, which represents the sum
of all digits of the original number.
This function is a simple and efficient way to compute the sum of the digits of an integer.
It iteratively extracts digits from the number, adds them to the sum, and then removes them until no digits remain.

*/

main() {
  print(Solution().sumOfTheDigitsOfHarshadNumber(18));
  print(Solution().sumOfTheDigitsOfHarshadNumber(23));
  print(Solution().sumOfTheDigitsOfHarshadNumber(24));
}
