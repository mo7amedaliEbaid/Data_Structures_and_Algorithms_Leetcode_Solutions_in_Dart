// Write a function that reverses a string. The input string is given as an array of characters s.
//
// You must do this by modifying the input array in-place with O(1) extra memory.
//
//
//
// Example 1:
//
// Input: s = ["h","e","l","l","o"]
// Output: ["o","l","l","e","h"]
// Example 2:
//
// Input: s = ["H","a","n","n","a","h"]
// Output: ["h","a","n","n","a","H"]

// Two Pointer
// a two-pointer approach. Specifically, it's an implementation of the Two-Pointers Technique.
//
// In this technique, we use two pointers that start from opposite ends of the array or list and move towards each other until
// they meet or cross each other. This approach is often used to solve problems involving arrays or lists where we need to find pairs of elements,
// reverse elements, or perform similar operations.
//
// In the provided reverseString method:
//
// We initialize two pointers left and right, pointing to the start and end of the list respectively.
// We enter a while loop that continues until left is less than right.
// Within the loop, we swap the elements at indices left and right, and then increment left and decrement right to move towards the center of the list.
// This process continues until the left and right pointers meet or cross each other, effectively reversing the elements in the list.
// Overall, the Two-Pointers Technique is efficient and often used to solve various array and list manipulation problems.
// It typically has a time complexity of O(n), where n is the size of the input list or array.
/*class Solution {
  void reverseString(List<String> s) {
    int left = 0, right = s.length - 1;

    while (left < right) {
      String temp = s[right];

      s[right--] = s[left];

      s[left++] = temp;
    }
  }
}*/

/*class Solution {
  void reverseString(List<String> s) {
    int left = 0;
    int right = s.length - 1;
    while (left < right) {
      String temp = s[left];
      s[left] = s[right];
      s[right] = temp;
      left++;
      right--;
    }
  }
}*/

/*int temp = a;
a = b;
b = temp;

Let's break it down step by step.

In Dart, variables hold values. When you assign a value to a variable, you're essentially storing that value in memory with a name (the variable name) to refer to it later.

Let's take the example:

dart
Copy code
int a = 10;
int b = 20;
Here, a is a variable holding the value 10, and b is a variable holding the value 20.

Now, let's look at the swapping part:

dart
Copy code
int temp = a;
a = b;
b = temp;
We create a new variable called temp and assign it the value of a. So now, temp holds the value 10.

We assign the value of b to a. So now, a holds the value 20.

We assign the value of temp to b. So now, b holds the value 10.*/
class Solution {
  void reverseString(List<String> s) {
    List<String> reversedList = s.reversed.toList();

    s.clear();
    s.addAll(reversedList);
  }
}

void main() {
  Solution solution = Solution();

  List<String> input = ["h", "e", "l", "l", "o"];
  print("Original: $input"); // Original: [h, e, l, l, o]

  solution.reverseString(input);
  print("Reversed: $input"); // Reversed: [o, l, l, e, h]
}
