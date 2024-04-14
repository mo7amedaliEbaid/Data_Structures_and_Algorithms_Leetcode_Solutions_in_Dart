
// Given the root of a binary tree, return the sum of all left leaves.
//
// A leaf is a node with no children. A left leaf is a leaf that is the left child of another node.
//
//
//
// Example 1:
//
//
// Input: root = [3,9,20,null,null,15,7]
// Output: 24
// Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
// Example 2:
//
// Input: root = [1]
// Output: 0

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int sumOfLeftLeaves(TreeNode? root) {
    if (root == null) return 0;

    // Check if the left child is a leaf node
    int sum = isLeaf(root.left) ? root.left!.val : 0;

    // Recursively calculate sum for left and right subtrees
    return sum + sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right);
  }

  bool isLeaf(TreeNode? node) {
    return node != null && node.left == null && node.right == null;
  }
}

void main() {
  // Example usage
  Solution solution = Solution();

  // Example 1
  TreeNode node1 = TreeNode(3);
  TreeNode node2 = TreeNode(9);
  TreeNode node3 = TreeNode(20);
  TreeNode node4 = TreeNode(15);
  TreeNode node5 = TreeNode(7);
  node1.left = node2;
  node1.right = node3;
  node3.left = node4;
  node3.right = node5;
  print(solution.sumOfLeftLeaves(node1)); // Output: 24

  // Example 2
  TreeNode node6 = TreeNode(1);
  print(solution.sumOfLeftLeaves(node6)); // Output: 0
}
