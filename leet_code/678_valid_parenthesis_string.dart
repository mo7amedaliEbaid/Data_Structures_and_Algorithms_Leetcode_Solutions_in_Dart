// Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.
//
// The following rules define a valid string:
//
// Any left parenthesis '(' must have a corresponding right parenthesis ')'.
// Any right parenthesis ')' must have a corresponding left parenthesis '('.
// Left parenthesis '(' must go before the corresponding right parenthesis ')'.
// '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".
//
//
// Example 1:
//
// Input: s = "()"
// Output: true
// Example 2:
//
// Input: s = "(*)"
// Output: true
// Example 3:
//
// Input: s = "(*))"
// Output: true


// Greedy
class Solution {
  bool checkValidString(String s) {
    int minOpen = 0;
    int maxOpen = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        minOpen++;
        maxOpen++;
      } else if (s[i] == ')') {
        minOpen = (minOpen > 0) ? minOpen - 1 : 0;
        maxOpen--;
      } else { // s[i] == '*'
        minOpen = (minOpen > 0) ? minOpen - 1 : 0;
        maxOpen++;
      }

      if (maxOpen < 0) {
        return false;
      }
    }

    return minOpen == 0;
  }
}

void main() {
  Solution solution = Solution();

  print(solution.checkValidString("()"));     // Output: true
  print(solution.checkValidString("(*)"));    // Output: true
  print(solution.checkValidString("(*))"));   // Output: true
}
// using Stack
/*class Solution {
  bool checkValidString(String s) {
    List<int> leftStack = [];
    List<int> starStack = [];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        leftStack.add(i);
      } else if (s[i] == '*') {
        starStack.add(i);
      } else {
        if (leftStack.isNotEmpty) {
          leftStack.removeLast();
        } else if (starStack.isNotEmpty) {
          starStack.removeLast();
        } else {
          return false;
        }
      }
    }

    while (leftStack.isNotEmpty && starStack.isNotEmpty) {
      if (leftStack.last > starStack.last) {
        return false;
      }
      leftStack.removeLast();
      starStack.removeLast();
    }

    return leftStack.isEmpty;
  }
}

void main() {
  Solution solution = Solution();

  print(solution.checkValidString("()"));     // Output: true
  print(solution.checkValidString("(*)"));    // Output: true
  print(solution.checkValidString("(*))"));   // Output: true
}*/
