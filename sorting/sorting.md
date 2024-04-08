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
  - 1. [“we”, “are”, “hello”, “world”, “sorting”, “learning”].
  - 2. [“we”, “are”, “world”, “hello”, “sorting”, “learning”].
- We consider `(1)` to be a stable sort since the equal elements “hello” and “world” are kept in the same relative order as the original sequence.
- A sorting algorithm is called stable if the elements of the same type retain their order after being sorted.

