// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
//
// Given a string s, return true if it is a palindrome, or false otherwise.
//
//
//
// Example 1:
//
// Input: s = "A man, a plan, a canal: Panama"
// Output: true
// Explanation: "amanaplanacanalpanama" is a palindrome.
// Example 2:
//
// Input: s = "race a car"
// Output: false
// Explanation: "raceacar" is not a palindrome.
// Example 3:
//
// Input: s = " "
// Output: true
// Explanation: s is an empty string "" after removing non-alphanumeric characters.
// Since an empty string reads the same forward and backward, it is a palindrome.

/*void main() {
  String sentence = "Hello! How are you? 123";

  // Remove non-alphanumeric characters using regular expressions
  String result = sentence.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
   result = result.replaceAll(' ', '');
  print(result); // Output: Hello How are you 123
}*/
class Solution {
  bool isPalindrome(String s) {
    String result = s.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
    print(result);
    result = result.replaceAll(' ', '');
    print(result);
    List<String> resultList = result.split('');
    print(resultList);
    Iterable<String> reversedList = resultList.reversed;
    print(reversedList);
    String revResult = reversedList.join('');
    print(revResult);
    if (revResult.toLowerCase() == result.toLowerCase()) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  }
}
main(){
  Solution().isPalindrome("A man, a plan, a canal: Panama");
}
