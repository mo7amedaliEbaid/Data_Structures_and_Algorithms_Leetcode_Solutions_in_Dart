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
- Selection sort follows the basic idea of bubble sort but improves this algorithm by reducing the number of swap operations.
- Selection sort will only swap at the end of each pass.
- Selection sort has a best, worst and average time complexity of O(n2), which is fairly dismal.
- It’s a simple one to understand, though, and it does perform better than bubble sort!

## Bubble Sort.
- One of the most straightforward sorts is the bubble sort, which repeatedly compares adjacent values and swaps them, if needed, to perform the sort.
- Therefore, the larger values in the set will `bubble up` to the end of the collection.
- For a collection of length n, you need to do at most n - 1 passes.
- This is the worst case. If any single pass doesn’t require a swap, that means the list is sorted and bubble sort can terminate early.
- Bubble sort, as a result, has worst case runtime of `O(n^2)` .
- The space complexity of bubble sort is `O(1)`. 
- All sorting operations involve swapping adjacent elements in the original input array, so no additional space is required.
- Bubble sort is also a stable sorting algorithm since equal elements will never have swapped places, so their relative ordering will be preserved.
- Bubble sort may be slow, but there are slower ones still.
- How about if you keep randomly shuffling the elements of the list until you finally get a list that just happens to be sorted?
- This “algorithm” is known as `bogosort`.
- It has an average time complexity of O(n × n!), and factorial time complexities are much worse than quadratic ones.

## Insertion Sort.
- Insertion sort is a more useful algorithm. Like bubble sort and selection sort,
- insertion sort has an average time complexity of O(n2), but the performance of
- insertion sort can vary. The more the data is already sorted, the less work it needs to do.
- Insertion sort has a best time complexity of O(n) if the data is already sorted.
- Dart itself uses the insertion sort. For lists with 32 or fewer elements, the sort method defaults to an insertion sort.
- Only for larger collections does Dart make use of a different sorting algorithm.
- The idea of insertion sort is similar to how many people sort a hand of cards.
- You start with the card at one end and then go through the unsorted cards one at a time,
- taking each one as you come to it and inserting it in the correct location among your previously sorted cards.
- It’s worth pointing out that the best-case scenario for insertion sort occurs when the sequence of values is already in sorted order and no left shifting is necessary.
- Insertion sort is one of the fastest sorting algorithms if the data is already sorted.
- That might sound obvious, but it isn’t true for all sorting algorithms.
- In practice, many data collections will already be largely — if not entirely — sorted,
- and insertion sort will perform exceptionally well in those scenarios.
- For small inputs, insertion sort almost always outperforms other sorts.
- Also when the number of inversions is small (the list is almost sorted), insertion sort is quite efficient,
- since there aren't many insertion operations required.