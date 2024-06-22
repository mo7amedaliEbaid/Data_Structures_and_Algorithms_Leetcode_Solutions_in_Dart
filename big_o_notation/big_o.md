# Big O notation
- Big O notation is a mathematical notation that describes the upper bound or worst-case scenario of the time or space complexity of an algorithm.
- It provides a way to quantify how the runtime or memory usage of an algorithm grows as the size of the input increases.
- Big O notation is represented as O(f(n)), where f(n) is a function that characterizes the growth rate of the algorithm in terms of the input size (n).
- The "O" stands for "order of magnitude."

## O(1) - Constant Time Complexity
- An algorithm with constant time complexity executes in the same amount of time regardless of the size of the input.
- In algorithms with O(1) complexity, the runtime or space required remains constant, regardless of the size of the input.
- These algorithms typically involve direct access to elements, simple arithmetic operations, or a fixed number of iterations.

## O(n) - Linear Time Complexity
- An algorithm with linear time complexity has a runtime that grows linearly with the size of the input.
- They typically involve iterating through each element in the input data structure once.

## O(n^2) - Quadratic Time Complexity
- An algorithm with quadratic time complexity has a runtime that grows quadratically with the size of the input.
- They typically involve nested iterations over the input data structure.

## O(log n) logarithmic time complexity. 
- In algorithm analysis, O(log n) represents logarithmic time complexity.
- It indicates that the runtime of an algorithm grows logarithmically as the size of the input (n) increases.
- In other words, as the size of the input doubles, the runtime increases by a constant factor.
- Logarithmic time complexity is often associated with algorithms that efficiently divide the input in half at each step,
- such as binary search on sorted arrays.
- Binary search is a classic example of an algorithm with O(log n) time complexity.
- It efficiently searches for a target value in a sorted array by repeatedly dividing the search interval in half.
- As the size of the sorted array doubles,
- the number of iterations required by binary search increases by a constant factor due to the logarithmic nature of the algorithm.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/ad9e5d111bfe7f497eec1542b53c96004ce48654/assets/bigO.png"  alt="big_o"/>
</p>


