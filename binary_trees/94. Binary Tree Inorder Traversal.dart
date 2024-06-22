// Given the root of a binary tree, return the inorder traversal of its nodes' values.
//
//
//
// Example 1:
//
//
// Input: root = [1,null,2,3]
// Output: [1,3,2]
// Example 2:
//
// Input: root = []
// Output: []
// Example 3:
//
// Input: root = [1]
// Output: [1]

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> result = [];
    _inorder(root, result);
    return result;
  }

  void _inorder(TreeNode? node, List<int> result) {
    if (node == null) {
      return;
    }

    // Recursively traverse left subtree
    _inorder(node.left, result);

    // Add the current node's value to the result
    result.add(node.val);

    // Recursively traverse right subtree
    _inorder(node.right, result);
  }
}

void main() {
  // Example usage
  Solution solution = Solution();

  // Example 1
  TreeNode node1 = TreeNode(1);
  TreeNode node2 = TreeNode(2);
  TreeNode node3 = TreeNode(3);
  node1.right = node2;
  node2.left = node3;
  print(solution.inorderTraversal(node1)); // Output: [1, 3, 2]

  // Example 2
  TreeNode? root2 = null;
  print(solution.inorderTraversal(root2)); // Output: []

  // Example 3
  TreeNode node4 = TreeNode(1);
  print(solution.inorderTraversal(node4)); // Output: [1]
}


// using stack
/*
import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> result = [];
    if (root == null) return result;

    Stack<TreeNode> stack = Stack();
    TreeNode? current = root;

    while (current != null || stack.isNotEmpty) {
      // Traverse left subtree and push nodes into the stack
      while (current != null) {
        stack.push(current);
        current = current.left;
      }

      // Pop the top node from the stack
      current = stack.pop();
      result.add(current!.val);

      // Move to the right subtree
      current = current.right;
    }

    return result;
  }
}

// Extension method to mimic Stack functionality in Dart
extension StackExtension<E> on Stack<E> {
  void push(E element) {
    addLast(element);
  }

  E pop() {
    return removeLast();
  }

  bool get isEmpty => isEmpty;
}

void main() {
  // Example usage
  Solution solution = Solution();

  // Example 1
  TreeNode node1 = TreeNode(1);
  TreeNode node2 = TreeNode(2);
  TreeNode node3 = TreeNode(3);
  node1.right = node2;
  node2.left = node3;
  print(solution.inorderTraversal(node1)); // Output: [1, 3, 2]

  // Example 2
  TreeNode? root2 = null;
  print(solution.inorderTraversal(root2)); // Output: []

  // Example 3
  TreeNode node4 = TreeNode(1);
  print(solution.inorderTraversal(node4)); // Output: [1]
}
*/
