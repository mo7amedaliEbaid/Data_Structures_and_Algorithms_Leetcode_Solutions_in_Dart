enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
    _buildHeap();
  }

  late final List<E> elements;
  final Priority priority;

  void _buildHeap() {
    if (isEmpty) return;
    final start = elements.length ~/ 2 - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(i);
    }

    // If a non-empty list is provided, you use that as the initial elements for the heap. You
    // loop through the list backwards, starting from the first non-leaf node, and sift all
    // parent nodes down. You loop through only half of the elements because there’s no
    // point in sifting leaf nodes down, only parent nodes.
    // You might wonder whether you could start at the front of the list and
    // call _siftUp on every element. Well, you’d be right. You could do that.
    // However, it wouldn’t be as efficient. Since the top of the heap has only one
    // node, you’d have to do more work to sift every other node toward this position.
    // And when sifting is required, the nodes are more likely to have to travel
    // further. The bottom of the heap, on the other hand, holds half of the nodes
    // already, and it doesn’t take so much work to sift the relatively fewer number of
    // nodes above them down.
    // In Big O notation, although a single up or down sift is O(log n), building a heap
    // using the up-sift algorithm has a time complexity of O(n log n), while building
    // it with the down-sift algorithm has a time complexity of only O(n).
  }

// This setup offers a few features:
// • The default is a max-heap, but users can also choose to create a min-heap.
// • You can optionally specify a list of elements to initialize your heap with. Later in
// the chapter, you’ll add a method to sort them.
// • Since elements of a heap need to be sortable, the element type extends
// Comparable . As mentioned in previous chapters, the reason for using
// Comparable<dynamic> here rather than Comparable<E> is because this makes int
// collections easier to create.


  bool get isEmpty => elements.isEmpty;
  int get size => elements.length;
  E? get peek => (isEmpty) ? null : elements.first;

  //Calling peek will give you the maximum value in the collection for a max-heap, or
// the minimum value in the collection for a min-heap. This is an O(1) operation.


// Accessing Parent and Child Indices
  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }
  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }
  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  //Selecting a Priority
// When you made the Heap constructor, you allowed the user to pass in a max or min
// priority. Add the following two helper methods that will make use of that property:
  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }
  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);
    return (isFirst) ? indexA : indexB;
  }

  // Both methods compare two inputs and return a value to indicate the one with the
// greater priority. However, the first method compares any two values while the
// second method compares the values at two specific indices in the list.
// Again, in a max-heap, the higher value has a greater priority, while in a min-heap, the
// lower value has a greater priority. Centralizing that decision here means that none of
// the code in the rest of the class knows whether it’s in a min-heap or max-heap. It
// just asks for the results of the priority comparison and goes on with its business.

//Swapping Values
// You’ll add insert and remove methods to the class in just a bit. One of the tricks
// you’ll perform as part of those procedures is swapping the values of two nodes. Add a
// helper method to Heap for that:

  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }


  // The procedure for moving a node to a higher level is called sifting up. What you do
// is compare the node in question to its parent. If the node is larger, then you swap the
// value with that of its parent. You continue swapping with the next parent up until
// the value is no longer larger than its parent. At that point, the sifting is finished and
// order has returned to the universe...or at least to your heap anyway.

// Implementing insert
  void insert(E value) {
// 1
    elements.add(value);
// 2
    _siftUp(elements.length - 1);
  }
  void _siftUp(int index) {
    var child = index;
    var parent = _parentIndex(child);
// 3
    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  // The implementation is pretty straightforward:
// 1. First you add the value that you want to insert to the end of the elements list.
// 2. Then you start the sifting procedure using the index of the value you just added.
// 3. As long as that value has a higher priority than its parent, then you keep
// swapping it with the next parent value. Since you’re only concerned about
// priority, this will sift larger values up in a max-heap and smaller values up in a
// min-heap.
// The overall complexity of insert is O(log n). Adding an element to a list takes only
// O(1) while sifting elements up in a heap takes O(log n).

// Removing From a Heap

  // Remember, the rule for a max-heap is that the value of every parent node must be
  // larger than or equal to the values of its children. If not, you must sift down.
  // To sift down, you start from the current value and check its left and right child. If one
  // of the children has a value that’s greater than the current value, you swap it with the
  // parent. If both children have a greater value, you swap the parent with the larger of
  // the two children. You continue to sift down until the node’s value is no longer larger
  // than the values of its children.

 // Implementing a Down Sift
  void _siftDown(int index) {
// 1
    var parent = index;
    while (true) {
// 2
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
// 3
      var chosen = _higherPriority(left, parent);
// 4
      chosen = _higherPriority(right, chosen);
// 5
      if (chosen == parent) return;
// 6
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }
  // _siftDown accepts an arbitrary index. The node in this index will always be treated
  // as the parent node. Here’s how the method works:
  // 1. Store the parent index to keep track of where you are in the traversal.
  // 2. Find the indices of the parent’s left and right children.
  // 3. The chosen variable is used to keep track of which index to swap with the parent.
  // If there’s a left child, and it has a higher priority than its parent, make it the
  // chosen one.
  // 4. If there’s a right child, and it has an even greater priority, it will become the
  // chosen one instead.
  // 5. If chosen is still parent , then no more sifting is required.
  // 6. Otherwise, swap chosen with parent , set it as the new parent, and continue
  // sifting.

// Implementing remove
  E? remove() {
    if (isEmpty) return null;
// 1
    _swapValues(0, elements.length - 1);
// 2
    final value = elements.removeLast();
// 3
    _siftDown(0);
    return value;
  }

  // Here’s how this method works:
  // 1. Swap the root with the last element in the heap.
  // 2. Before removing it from the list, save a copy so that you can return the value at
  // the end of the method.
  // 3. The heap may not be a max- or min-heap anymore, so you must perform a down
  // sift to make sure it conforms to the rules.
  // The overall complexity of remove is O(log n). Swapping elements in a list is only O(1)
  // while sifting elements down in a heap takes O(log n) time.

  // Removing From an Arbitrary Index
  E? removeAt(int index) {
    final lastIndex = elements.length - 1;
// 1
    if (index < 0 || index > lastIndex) {
      return null;
    }
// 2
    if (index == lastIndex) {
      return elements.removeLast();
    }
// 3
    _swapValues(index, lastIndex);
    final value = elements.removeLast();
// 4
    _siftDown(index);
    _siftUp(index);
    return value;
  }

  // To remove an arbitrary element from the heap, you need an index. Given that, here’s
  // what happens next:
  // 1. Check to see if the index is within the bounds of the list. If not, return null .
  // 2. If you’re removing the last element in the heap, you don’t need to do anything
  // special. Simply remove it and return the value.
  // 3. If you’re not removing the last element, first swap the element with the last
  // element. Then, remove the last element, saving its value to return at the end.
  // 4. Perform a down sift and an up sift to adjust the heap.
// Removing an arbitrary element from a heap is an O(log n) operation. However, it also
// requires knowing the index of the element you want to delete.

  // Searching for an Element in a Heap

  // To find the index of the element you wish to delete, you need to perform a search on
  // the heap. Unfortunately, heaps are not designed for fast searches. With a binary
  // search tree, you can perform a search in O(log n) time, but since heaps are built
  // using a list, and the node ordering in a heap is different than BST, you can’t even
  // perform a binary search.
  // Searching for an element in a heap is, in the worst-case, an O(n) operation since you
  // may have to check every element in the list. However, you can optimize the search by
  // taking advantage of the heap’s max or min priority.
  // Add the following recursive function to Heap :

  int indexOf(E value, {int index = 0}) {
// 1
    if (index >= elements.length) {
      return -1;
    }
// 2
    if (_firstHasHigherPriority(value, elements[index])) {
      return -1;
    }
// 3
    if (value == elements[index]) {
      return index;
    }
// 4
    final left = indexOf(value, index: _leftChildIndex(index));
    if (left != -1) return left;
    return indexOf(value, index: _rightChildIndex(index));
  }

  // Here’s what’s happening:
  // 1. If the index is too big, the search failed. Return -1 . Alternatively, you could
  // rewrite the method to return null , but -1 is what List uses in its indexOf
  // method.
  // 2. This step is the optimization part. Check to see if the value you’re looking for has
  // a higher priority than the current node at your recursive traversal of the tree. If it
  // does, the value you’re looking for cannot possibly be lower in the heap. For
  // example, if you’re looking for 10 in a max-heap, but the current node has a value
  // of 9, there’s no use checking all the nodes below 9 because they’re just going to
  // be even lower.
  // 3. If the value you’re looking for is equal to the value at index , you found it. Return
  // index .
  // 4. Recursively search for the value starting from the left child and then on to the
  // right child. If both searches fail, the whole search fails. Return -1 .


  @override
  String toString() => elements.toString();
}


/*void main() {
  final heap = Heap<int>();
  heap.insert(8);
  heap.insert(6);
  heap.insert(5);
  heap.insert(4);
  heap.insert(3);
  heap.insert(2);
  heap.insert(1);
  print(heap);
  heap.insert(7);
  print(heap);
}*/
/*
main(){
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(8);
  heap.insert(5);
  heap.insert(4);
  heap.insert(6);
  heap.insert(2);
  heap.insert(1);
  heap.insert(3);
  final root = heap.remove();
  print(root);
  print(heap);
}*/
/*
main(){
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(7); // remove this
  heap.insert(2);
  heap.insert(5);
  heap.insert(1);
  final index = 1;
  heap.removeAt(index);
  print(heap);
}*/
main(){
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(7);
  heap.insert(2);
  heap.insert(5);
  heap.insert(1);
  print(heap);
  final index = heap.indexOf(7);
  print(index);
  var heap1 = Heap(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  print(heap1);
  // The constructor creates a max-heap from the elements of the list. Then the while
  // loop repeatedly removes the largest element until none are left
  while (!heap1.isEmpty) {
    print(heap1.remove());
  }

  var heap2 = Heap(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
    priority: Priority.min,
  );
  print(heap2);
  while (!heap2.isEmpty) {
    print(heap2.remove());
  }
}