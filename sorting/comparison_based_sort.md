# Comparison Based Sort.
- Comparison based sorts are sorting algorithms that require a direct method of comparison defined by the ordering relation.
- In a sense, they are the most natural sorting algorithms since, intuitively, when we think about sorting elements,
- we instinctively think about comparing elements to each other.

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
