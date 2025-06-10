// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']',
// determine if the input string is valid.
//
// An input string is valid if:
//
// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Every close bracket has a corresponding open bracket of the same type.
class Solution {
  bool isValid(String s) {
    List<String> stack = [];

    for (var char in s.split('')) {
      if (char == '(' || char == '{' || char == '[') {
        // Push opening brackets onto the stack
        stack.add(char);
      } else {
        // If stack is empty, there's no opening bracket to match with
        if (stack.isEmpty) return false;

        // Check if the closing bracket matches the expected opening bracket
        String last = stack.removeLast();
        if ((char == ')' && last != '(') ||
            (char == '}' && last != '{') ||
            (char == ']' && last != '[')) {
          return false;
        }
      }
    }

    // If stack is empty, all brackets matched correctly
    return stack.isEmpty;
  }
}
