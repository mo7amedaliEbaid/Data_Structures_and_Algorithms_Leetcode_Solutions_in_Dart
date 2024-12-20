// Given the root of a binary tree, invert the tree, and return its root.

/**
 * Definition for a binary tree node.

 */
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? invertTree(TreeNode? root) {
    if (root != null) {
      var temp = root.left;
      root.left = root.right;
      root.right = temp;
      invertTree(root.left);
      invertTree(root.right);
      return root;
    } else {
      return null;
    }
  }
}
