# Binary Tree
- A `tree` is a frequently-used data structure to simulate a hierarchical tree structure.

- Each node of the tree will have a root value and a list of references to other nodes which are called child nodes.
- From graph view, a tree can also be defined as a directed acyclic graph which has N nodes and N-1 edges.

- A Binary Tree is one of the most typical tree structure. As the name suggests,
- a binary tree is a tree data structure in which each node has at most two children,
- which are referred to as the left child and the right child.
- A binary tree is a tree where each node has at most two children, often referred to as the left and right children.

## Traversal Algorithms.
### In-Order Traversal.
- An in-order traversal visits the nodes of a binary tree in the following order, starting from the root node:
  - 1. If the current node has a left child, recursively visit this child first.
  - 2. Then visit the node itself.
  - 3. If the current node has a right child, recursively visit this child.
- Typically, for `binary search tree`, we can retrieve all the data in sorted order using in-order traversal.

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
- t is worth noting that when you delete nodes in a tree, deletion process will be in post-order.
- That is to say, when you delete a node, you will delete its left child and its right child before you delete the node itself.

- Also, post-order is widely used in mathematical expressions. It is easier to write a program to parse a post-order expression.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/f3d63f7de82262edfaff7adb06291a3ec56eb7a0/assets/post_order.png"  alt="tree"/>
</p>

## Comparison.
- traverseInOrder : left → action → right
- traversePreOrder : action → left → right
- traversePostOrder : left → right → action
- The difference is only in where the action takes place.
- Each one of these traversal algorithms has a time and space complexity of O(n)