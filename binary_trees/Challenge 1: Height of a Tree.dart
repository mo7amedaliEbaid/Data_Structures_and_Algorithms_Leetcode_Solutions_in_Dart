// Given a binary tree, find the height of the tree. The height of the binary tree is
// determined by the distance between the root and the furthest leaf. The height of a
// binary tree with a single node is zero since the single node is both the root and the
// furthest leaf.

// ┌──25
// │ └──17
// 15
// │ ┌──12
// └──10
// └──5
import 'binary_node.dart';
import 'dart:math';

BinaryNode<int> createBinaryTree() {
  final n15 = BinaryNode(15);
  final n10 = BinaryNode(10);
  final n5 = BinaryNode(5);
  final n12 = BinaryNode(12);
  final n25 = BinaryNode(25);
  final n17 = BinaryNode(17);
  n15.leftChild = n10;
  n10.leftChild = n5;
  n10.rightChild = n12;
  n15.rightChild = n25;
  n25.leftChild = n17;
  return n15;
}
// A recursive approach for finding the height of a binary tree doesn’t take much code:

int height(BinaryNode? node) {
// 1
  if (node == null) return -1;
  // 2
  return 1 +
      max(
        height(node.leftChild),
        height(node.rightChild),
      );
}

// 1. This is the base case for the recursive solution. If the node is null , you’ll return
// -1 .
// 2. Here, you recursively call the height function. For every node you visit, you add
// one to the height of the highest child.
// This algorithm has a time complexity of O(n) since you need to traverse through all
// the nodes. This algorithm incurs a space cost of O(n) since you need to make the
// same n recursive calls to the call stack.
