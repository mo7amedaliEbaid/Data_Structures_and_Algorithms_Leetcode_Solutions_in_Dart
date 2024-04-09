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
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/d84ae32d10fea85dfe1da42ab8ff85fc3bbb772e/assets/exam.jpeg"  alt="linked list"/>
</p>

- Note that unlike a binary search tree, it’s not a requirement of the heap property that the left or right child needs to be greater.
- For that reason, a heap is only a partially sorted tree.
- Another essential aspect of a heap is its `shape property`.
- A heap must be a complete binary tree.
- This means that every level must be filled except for the last level.
- Additionally, when adding elements to the last level, you must add them from left to right.