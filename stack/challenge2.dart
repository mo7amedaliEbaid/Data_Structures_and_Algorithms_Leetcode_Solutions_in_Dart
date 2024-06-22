// Challenge 2: Balance the Parentheses
// Check for balanced parentheses. Given a string, check if there are ( and ) characters,
// and return true if the parentheses in the string are balanced. For example:
// // 1
// "h((e))llo(world)()" // balanced parentheses
// // 2
// (hello world // unbalanced parentheses

import 'stack.dart';

class Challenge2 {
  // To check if there are balanced parentheses in the string, you need to go through each
  // character of the string. When you encounter an opening parenthesis, you’ll push that
  // onto a stack. Conversely, if you encounter a closing parenthesis, you should pop the
  // stack.

  bool checkParentheses(String text) {
    var stack = Stack<int>();
    final open = '('.codeUnitAt(0);
    final close = ')'.codeUnitAt(0);

    for (int codeUnit in text.codeUnits) {
      if (codeUnit == open) {
        stack.push(codeUnit);
      } else if (codeUnit == close) {
        if (stack.isEmpty) {
          return false;
        } else {
          stack.pop();
        }
      }
    }
    return stack.isEmpty;
  }
}

void main() {
  bool result1 = Challenge2().checkParentheses("h((e))llo(world)()");
  bool result2 = Challenge2().checkParentheses("h((e)llo(world)(");
  print(result1.toString());
  print(result2.toString());
}
