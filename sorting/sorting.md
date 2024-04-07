# Sorting.
- A `sort` is formally defined as a rearrangement of a sequence of elements that puts all elements into a non-decreasing order based on the ordering relation.
- The fundamental problem of sorting is all about ordering a collection of items. How you order these items is entirely based on the method of comparison. 
- At the most basic level, sorting algorithms are all about rearranging elements in a collection based on a common characteristic of those elements.
- An `ordering relation` has two key properties:
  - 1. Given two elements a and b, exactly one of the following must be true: a < b, a = b , or a > b `(Law of Trichotomy)` 
  - 2. If a < b and b < c, then a < c `(Law of Transitivity)`.
- The ordering relation practically is defined as a method of comparison in programming languages. 

## Inversions.
- An important concept in sorting is `inversions`. 
- An inversion in a sequence is defined as a pair of elements that are out of order with respect to the ordering relation.
- The more inversions present, the more out of order the list is.
- In fact, the concept of inversions introduces an alternative definition of sorting:
  - Given a sequence of elements with n inversions, a sorting algorithm is a sequence of operations that reduces inversions to 0.

## Stability of sorting algorithms.

- The key feature of a stable sorting algorithm is that it will preserve the order of equal elements.
- if our original sequence was \text{[“hello”, “world”, “we”, “are”, “learning, “sorting”]}.
- There are two valid sorts for this sequence:
  - 1. \text{[“we”, “are”, “hello”, “world”, “sorting”, “learning”]}.
  - 2. \text{[“we”, “are”, “world”, “hello”, “sorting”, “learning”]}.
- We consider `(1)` to be a stable sort since the equal elements “hello” and “world” are kept in the same relative order as the original sequence.

## Comparison Based Sort.
- Comparison based sorts are sorting algorithms that require a direct method of comparison defined by the ordering relation.
- In a sense, they are the most natural sorting algorithms since, intuitively, when we think about sorting elements,
- we instinctively think about comparing elements to each other.
-  `Selection Sort`

##  Selection Sort.
- Suppose we had a collection of elements where every element is an integer.
- Selection sort will build up the sorted list by repeatedly finding the minimum element in that list and moving it to the front of the list through a swap.
- It will proceed to swap elements appropriately until the entire list is sorted.
- In terms of simplicity, it is a highly intuitive algorithm and not too difficult to write. Unfortunately, it is pretty slow, requiring `O(n^2)` time to sort the list in the worst case.
- In the worst case, we have to search the entire array to find the minimum element, meaning we can have up to n + (n - 1) + (n - 2) +....+1 total operations, which is `O(n^2)`.
- The space complexity of selection sort is `O(1)` since we do not use any additional space during the algorithm (all operations are in-place).
- It also is `not a stable` sorting algorithm. For example consider the collection [4, 2, 3, 4, 1].
- After the first round of selection sort, we get the array [1, 2, 3, 4, 4]. 
- This array is sorted, but it does not preserve the ordering of equal elements.

