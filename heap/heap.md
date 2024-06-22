# Heap
- Heaps are another classical tree-based data structure with special properties to quickly fetch the largest or smallest element.
- A heap is a complete binary tree, also known as a binary heap, that can be constructed using a list.
- Heaps come in two flavors:
  - 1. `Max-heap`, in which elements with a higher value have a higher priority.
  - 2. `Min-heap`, in which elements with a lower value have a higher priority.
- A heap has an essential characteristic that must always be satisfied. This characteristic is known as the `heap property`:
  - In a max-heap, parent nodes must always contain a value that is greater than or equal to the value in its children.
  - The root node will always contain the highest value.
  - In a min-heap, parent nodes must always contain a value that is less than or equal to the value in its children.
  - The root node will always contain the lowest value.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/f3d63f7de82262edfaff7adb06291a3ec56eb7a0/assets/heap_property.png"  alt="heap"/>
</p>

- Note that unlike a binary search tree, it’s not a requirement of the heap property that the left or right child needs to be greater.
- For that reason, a heap is only a partially sorted tree.
- Another essential aspect of a heap is its `shape property`.
- A heap must be a complete binary tree.
- This means that every level must be filled except for the last level.
- Additionally, when adding elements to the last level, you must add them from left to right.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/f3d63f7de82262edfaff7adb06291a3ec56eb7a0/assets/heap_shape.png"  alt="heap"/>
</p>

## Heap Applications.
- Calculating the minimum or maximum element of a collection.
- Implementing the heapsort algorithm.
- Constructing a priority queue.
- Building graph algorithms that use a priority queue, like `Dijkstra’s algorithm`.

## Fitting a Binary Tree Into a List.
- Trees hold nodes that store references to their children. In the case of a binary tree, these are references to a left and right child.
- Heaps are binary trees, but they are implemented with a simple list.
- Using a list might seem like an unusual way to build a tree, but one of the benefits of this heap implementation is efficient time and space complexity since the elements in a heap are all stored together in memory.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/26764083f6e37e95ba181a80b13dd53fea228469/assets/heap_list.png"  alt="heap"/>
</p>

## Accessing Nodes.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/4e7d59d3fecb64435d0910e034318a135c6d3fb0/assets/accessing_heap.png"  alt="heap"/>
</p>
