//Given a string s of '(' , ')' and lowercase English characters.
//
// Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.
//
// Formally, a parentheses string is valid if and only if:
//
// It is the empty string, contains only lowercase characters, or
// It can be written as AB (A concatenated with B), where A and B are valid strings, or
// It can be written as (A), where A is a valid string.
//
//
// Example 1:
//
// Input: s = "lee(t(c)o)de)"
// Output: "lee(t(c)o)de"
// Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
// Example 2:
//
// Input: s = "a)b(c)d"
// Output: "ab(c)d"
// Example 3:
//
// Input: s = "))(("
// Output: ""
// Explanation: An empty string is also valid.
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

class Solution {
  String minRemoveToMakeValid(String s) {
    Stack<int> stack = Stack();
    List<int> indicesToRemove = [];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.push(i);
      } else if (s[i] == ')') {
        if (stack.isNotEmpty) {
          stack.pop();
        } else {
          indicesToRemove.add(i);
        }
      }
    }

    // Mark any remaining opening parentheses left on the stack for removal
    indicesToRemove.addAll(stack._storage);

    // Construct the resulting string
    StringBuffer result = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (!indicesToRemove.contains(i)) {
        result.write(s[i]);
      }
    }

    return result.toString();
  }
}

void main() {
  Solution solution = Solution();

  // Example cases
  print(
      solution.minRemoveToMakeValid("lee(t(c)o)de)")); // Output: "lee(t(c)o)de"
  print(solution.minRemoveToMakeValid("a)b(c)d")); // Output: "ab(c)d"
  print(solution.minRemoveToMakeValid("))((")); // Output: ""
}

/*class Solution {
  String minRemoveToMakeValid(String s) {
    List<int> indicesToRemove = [];
    List<int> stack = [];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(i);
      } else if (s[i] == ')') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        } else {
          indicesToRemove.add(i);
        }
      }
    }

    // Mark any remaining opening parentheses left on the stack for removal
    indicesToRemove.addAll(stack);

    // Construct the resulting string
    StringBuffer result = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (!indicesToRemove.contains(i)) {
        result.write(s[i]);
      }
    }

    return result.toString();
  }
}

void main() {
  Solution solution = Solution();

  // Example cases
  print(solution.minRemoveToMakeValid("lee(t(c)o)de)")); // Output: "lee(t(c)o)de"
  print(solution.minRemoveToMakeValid("a)b(c)d")); // Output: "ab(c)d"
  print(solution.minRemoveToMakeValid("))((")); // Output: ""
}*/
