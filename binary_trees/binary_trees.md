# Binary Tree
- A binary tree is a tree where each node has at most two children, often referred to as the left and right children.

## Traversal Algorithms.
### In-Order Traversal.
- An in-order traversal visits the nodes of a binary tree in the following order, starting from the root node:
  - 1. If the current node has a left child, recursively visit this child first.
  - 2. Then visit the node itself.
  - 3. If the current node has a right child, recursively visit this child.

### Pre-Order Traversal
- Pre-order traversal always visits the current node first, then recursively visits the left and right child.

### Post-Order Traversal
- Post-order traversal only visits the current node after the left and right child have been visited recursively.
- In other words, given any node, you’ll visit its children before visiting itself. An interesting consequence of this is that the root node is always visited last.

## Comparison.
- traverseInOrder : left → action → right
- traversePreOrder : action → left → right
- traversePostOrder : left → right → action
- The difference is only in where the action takes place.
- Each one of these traversal algorithms has a time and space complexity of O(n)