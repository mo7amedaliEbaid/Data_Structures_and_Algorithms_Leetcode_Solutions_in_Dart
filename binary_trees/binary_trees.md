# Binary Tree
- A binary tree is a tree where each node has at most two children, often referred to as the left and right children.

## Traversal Algorithms.
### In-Order Traversal.
- An in-order traversal visits the nodes of a binary tree in the following order, starting from the root node:
  - 1. If the current node has a left child, recursively visit this child first.
  - 2. Then visit the node itself.
  - 3. If the current node has a right child, recursively visit this child.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/f3d63f7de82262edfaff7adb06291a3ec56eb7a0/assets/in_order.png"  alt="tree"/>
</p>

### Pre-Order Traversal
- Pre-order traversal always visits the current node first, then recursively visits the left and right child.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/f3d63f7de82262edfaff7adb06291a3ec56eb7a0/assets/pre_order.png"  alt="tree"/>
</p>

### Post-Order Traversal
- Post-order traversal only visits the current node after the left and right child have been visited recursively.
- In other words, given any node, you’ll visit its children before visiting itself. An interesting consequence of this is that the root node is always visited last.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/f3d63f7de82262edfaff7adb06291a3ec56eb7a0/assets/post_order.png"  alt="tree"/>
</p>

## Comparison.
- traverseInOrder : left → action → right
- traversePreOrder : action → left → right
- traversePostOrder : left → right → action
- The difference is only in where the action takes place.
- Each one of these traversal algorithms has a time and space complexity of O(n)