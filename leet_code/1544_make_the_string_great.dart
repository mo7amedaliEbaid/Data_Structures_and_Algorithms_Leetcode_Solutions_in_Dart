// Given a string s of lower and upper case English letters.
//
// A good string is a string which doesn't have two adjacent characters s[i] and s[i + 1] where:
//
// 0 <= i <= s.length - 2
// s[i] is a lower-case letter and s[i + 1] is the same letter but in upper-case or vice-versa.
// To make the string good, you can choose two adjacent characters that make the string bad and remove them. You can keep doing this until the string becomes good.
//
// Return the string after making it good. The answer is guaranteed to be unique under the given constraints.
//
// Notice that an empty string is also good.
//
//
//
// Example 1:
//
// Input: s = "leEeetcode"
// Output: "leetcode"
// Explanation: In the first step, either you choose i = 1 or i = 2, both will result "leEeetcode" to be reduced to "leetcode".
// Example 2:
//
// Input: s = "abBAcC"
// Output: ""
// Explanation: We have many possible scenarios, and all lead to the same answer. For example:
// "abBAcC" --> "aAcC" --> "cC" --> ""
// "abBAcC" --> "abBA" --> "aA" --> ""

/*String makeGood(String s) {
  List<String> stack = [];

  for (int i = 0; i < s.length; i++) {
    if (stack.isNotEmpty &&
        (stack.last.toLowerCase() == s[i].toLowerCase()) &&
        (stack.last != s[i])) {
      stack.removeLast();
    } else {
      stack.add(s[i]);
    }
  }

  return stack.join('');
}

void main() {
  print(makeGood("leEeetcode")); // Output: "leetcode"
}*/
// Explanation of the solution:
//
// We use a stack to keep track of the characters.
// We iterate through each character in the input string s.
// For each character, we check if the stack is not empty,
// if the last character in the stack is the opposite case of the current character,
// and if they are the same character (ignoring case).
// If these conditions are met, we remove the last character from the stack because it makes the string bad.
// If the conditions are not met, we add the current character to the stack.
// After iterating through all characters, we join the characters in the stack and return the resulting string,
// which is the string after making it good.

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();
  E get peek => _storage.last;
  bool get isEmpty => _storage.isEmpty;
  bool get isNotEmpty => !isEmpty;
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}

String makeGood(String s) {
  Stack<String> stack = Stack();

  for (int i = 0; i < s.length; i++) {
    if (stack.isNotEmpty &&
        (stack.peek.toLowerCase() == s[i].toLowerCase()) &&
        (stack.peek != s[i])) {
      stack.pop();
    } else {
      stack.push(s[i]);
    }
  }

  List<String> result = [];
  while (stack.isNotEmpty) {
    result.add(stack.pop());
  }

  return result.reversed.join('');
}

void main() {
  print(makeGood("leEeetcode")); // Output: "leetcode"
}
