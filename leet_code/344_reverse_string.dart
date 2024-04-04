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
// In this technique, we use two pointers that start from opposite ends of the array or list and move towards each other until they meet or cross each other. This approach is often used to solve problems involving arrays or lists where we need to find pairs of elements, reverse elements, or perform similar operations.
//
// In the provided reverseString method:
//
// We initialize two pointers left and right, pointing to the start and end of the list respectively.
// We enter a while loop that continues until left is less than right.
// Within the loop, we swap the elements at indices left and right, and then increment left and decrement right to move towards the center of the list.
// This process continues until the left and right pointers meet or cross each other, effectively reversing the elements in the list.
// Overall, the Two-Pointers Technique is efficient and often used to solve various array and list manipulation problems. It typically has a time complexity of O(n), where n is the size of the input list or array.
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