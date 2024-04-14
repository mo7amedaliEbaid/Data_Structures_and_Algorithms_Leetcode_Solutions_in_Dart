// Given the root of a binary tree, return the preorder traversal of its nodes' values.
//
//
//
// Example 1:
//
//
// Input: root = [1,null,2,3]
// Output: [1,2,3]
// Example 2:
//
// Input: root = []
// Output: []
// Example 3:
//
// Input: root = [1]
// Output: [1]
import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    List<int> result = [];
    if (root == null) {
      return result;
    }

    // Add the root value to the result
    result.add(root.val);

    // Recursively traverse left subtree
    if (root.left != null) {
      result.addAll(preorderTraversal(root.left));
    }

    // Recursively traverse right subtree
    if (root.right != null) {
      result.addAll(preorderTraversal(root.right));
    }

    return result;
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
  print(solution.preorderTraversal(node1)); // Output: [1, 2, 3]

  // Example 2
  TreeNode? root2 = null;
  print(solution.preorderTraversal(root2)); // Output: []

  // Example 3
  TreeNode node4 = TreeNode(1);
  print(solution.preorderTraversal(node4)); // Output: [1]
}
//Solution - 1 Recursive with helper Function
class Solution1 {
// Runtime: 448 ms, faster than 77.78% of Dart online submissions for Binary Tree Preorder Traversal.
// Memory Usage: 140.1 MB, less than 88.89% of Dart online submissions for Binary Tree Preorder Traversal.
  List<int> preorderTraversal(TreeNode? root) {
    List<int> list = List.empty(growable: true);
    preOrder(root, list);
    return list;
  }

  void preOrder(TreeNode? root, List<int> list) {
    if (root == null) return;
    list.add(root.val);
    preOrder(root.left, list);
    preOrder(root.right, list);
  }
}

//Solution - 2 Recursive without Helper Function
class Solution2 {
// Runtime: 418 ms, faster than 94.44% of Dart online submissions for Binary Tree Preorder Traversal.
// Memory Usage: 140.6 MB, less than 16.67% of Dart online submissions for Binary Tree Preorder Traversal.

  // Global list to hold our values
  List<int> preorder = List.empty(growable: true);
  List<int> preorderTraversal(TreeNode? root) {
    // if tree-node is empty than we will return empty list
    if (root == null) return preorder;
    // else we will add the value into the list
    preorder.add(root.val);
    // adding the value from left side
    preorderTraversal(root.left);
    // adding OR arranging value from right side
    preorderTraversal(root.right);

    return preorder;
  }
}

//Solution - 3 Iterative Approach Using Stack



class Solution3 {
// Runtime: 503 ms, faster than 44.44% of Dart online submissions for Binary Tree Preorder Traversal.
// Memory Usage: 142.7 MB, less than 16.67% of Dart online submissions for Binary Tree Preorder Traversal.
  List<int> preorderTraversal(TreeNode? root) {
    // Create an array list to store the solution result...
    List<int> sol = List.empty(growable: true);
    // Return the solution answer if the tree is empty...
    if (root == null) return sol;
    // Create an empty stack and push the root node...
    Queue<TreeNode?> bag = Queue();
    bag.add(root);
    // Loop till stack is empty...
    while (!bag.isEmpty) {
      // Pop a node from the stack...
      TreeNode? node = bag.removeLast();
      sol.add(node!.val);
      // Push the right child of the popped node into the stack...
      if (node.right != null) bag.add(node.right);
      // Push the left child of the popped node into the stack...
      if (node.left != null) bag.add(node.left);
    }
    return sol; // Return the solution list...
  }
}