//You are given a large integer represented as an integer array digits,
// where each digits[i] is the ith digit of the integer.
// The digits are ordered from most significant to least significant in left-to-right order.
// The large integer does not contain any leading 0's.

//Increment the large integer by one and return the resulting array of digits.

/*
Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].*/

List<int> plusOne(List<int> digits) {
  int carry = 1; // Start with carry 1 since we are incrementing by one
  int index = digits.length - 1;

  while (carry > 0 && index >= 0) {
    int sum = digits[index] + carry;
    digits[index] = sum % 10; // Update the current digit
    carry = sum ~/ 10; // Update the carry
    index--; // Move to the next more significant digit
  }

  // If carry is still remaining after processing all digits, we need to insert a new digit
  if (carry > 0) {
    digits.insert(0, carry);
  }

  return digits;
}

void main() {
  List<int> digits = [1,2,3];
  List<int> result = plusOne(digits);
  print("Result: $result"); // Output: Result: [1, 0, 0, 0]
}


