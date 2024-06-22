//A palindrome is a word, number, phrase, or other sequence of symbols that reads the same backwards as forwards,
// such as madam or racecar.
bool isPalindrome(int x) {
  if (x < 0) return false; // Negative numbers are not palindromes
  if (x < 10) return true; // Single digit numbers are palindromes

  int reversed = 0;
  int original = x;

  while (x != 0) {
    int digit = x % 10;
    reversed = reversed * 10 + digit;
    print("reversed=$reversed");
    x ~/= 10; // Integer division in Dart
  }

  return original == reversed;
}

//This function first checks if the number is negative (which would make it not a palindrome) or if it's a single digit number (which is always a palindrome).
//Then, it iterates through the digits of the number, reversing it, and finally compares the original number with the reversed one to determine if it's a palindrome.

void main() {
  print(isPalindrome(121)); // Output: true
  print(isPalindrome(-121)); // Output: false
  print(isPalindrome(10)); // Output: false
  print(isPalindrome(101));
  print(isPalindrome(100));
  print(isPalindrome(101010101));
  int a = 10;
  int b = 3;
  a ~/= b; // This is equivalent to: a = a ~/ b;
  print(a); // Output: 3
  // In this example, a ~/= b divides a by b using integer division and assigns the result back to a. So, a becomes 3 after the operation.

//  This operator is particularly useful when you want to perform integer division and update the value of the variable in place.
}
// what is ~/= mean in dart?
//In Dart, the operator ~/= is the compound assignment operator for integer division.
// It is used to perform integer division and then assign the result back to the variable.
