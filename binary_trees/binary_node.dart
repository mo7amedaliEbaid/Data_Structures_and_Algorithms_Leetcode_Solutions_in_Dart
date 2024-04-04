class BinaryNode<T> {
  BinaryNode(this.value);

  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

// You may have noticed that this prints the example tree in ascending order. If the tree
// nodes are structured in a certain way, in-order traversal visits them in ascending
// order! Binary search trees take advantage of this
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  // You call action before recursively traversing the children, hence the “pre” of pre-
  // order traversal

  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

// Note that you perform action after the recursive traversal calls.
  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}

main() {
  BinaryNode<int> createBinaryTree() {
    final zero = BinaryNode(0);
    final one = BinaryNode(1);
    final five = BinaryNode(5);
    final seven = BinaryNode(7);
    final eight = BinaryNode(8);
    final nine = BinaryNode(9);
    seven.leftChild = one;
    one.leftChild = zero;
    one.rightChild = five;
    seven.rightChild = nine;
    nine.leftChild = eight;
    return seven;
  }

  final tree = createBinaryTree();
  print(tree);
  tree.traverseInOrder(print);
  tree.traversePreOrder(print);
  tree.traversePostOrder(print);
}
