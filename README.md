# Data Structures & Algorithms in Dart

A comprehensive collection of data structure implementations, algorithm notes, and LeetCode solutions written primarily in **Dart**, with selected problems also solved in Java, Python, Rust, C++, C#, and JavaScript.

---

## Contents

- [Big O Notation](#big-o-notation)
- [Data Structures](#data-structures)
- [Algorithms](#algorithms)
- [LeetCode Solutions](#leetcode-solutions)
- [References](#references)

---

## Big O Notation

Big O describes the **upper bound** of time or space complexity as input size grows.

| Complexity | Name        | Example                          |
|------------|-------------|----------------------------------|
| O(1)       | Constant    | Array index access               |
| O(log n)   | Logarithmic | Binary search                    |
| O(n)       | Linear      | Linear scan                      |
| O(n log n) | Linearithmic| Merge sort                       |
| O(n²)      | Quadratic   | Bubble sort, nested loops        |

<p>
  <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/ad9e5d111bfe7f497eec1542b53c96004ce48654/assets/bigO.png" alt="Big O Chart" width="600"/>
</p>

> Source: [`big_o_notation/`](big_o_notation/)

---

## Data Structures

### Linked List

A sequence of nodes where each node stores a value and a pointer to the next node.

```
head
 │
[1] → [2] → [3] → [4] → null
```

| Operation       | Singly LL | Doubly LL |
|-----------------|-----------|-----------|
| Insert at head  | O(1)      | O(1)      |
| Insert at tail  | O(n)      | O(1)      |
| Remove at head  | O(1)      | O(1)      |
| Search          | O(n)      | O(n)      |

<p>
  <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/main/assets/doubly_liked_list.png" alt="Doubly Linked List" width="500"/>
</p>

> Source: [`linked_list/`](linked_list/)

---

### Stack

A **LIFO** (Last-In, First-Out) structure. Only `push` and `pop` are allowed, both O(1).

```
     ┌───┐
top →│ 4 │  ← push / pop here
     ├───┤
     │ 3 │
     ├───┤
     │ 2 │
     ├───┤
     │ 1 │
     └───┘
```

> Source: [`stack/`](stack/)

---

### Queue

A **FIFO** (First-In, First-Out) structure. Four implementations are provided:

| Implementation           | Enqueue | Dequeue |
|--------------------------|---------|---------|
| List-based               | O(1)    | O(n)    |
| Doubly linked list       | O(1)    | O(1)    |
| Ring buffer              | O(1)    | O(1)    |
| Double-stack             | O(1) amortized | O(1) amortized |

<p>
  <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/main/assets/queue.png" alt="Queue" width="500"/>
</p>

> Source: [`queue/`](queue/)

---

### Binary Tree

A tree where each node has at most two children. Three traversal orders are implemented:

```
        1
       / \
      2   3
     / \
    4   5
```

| Traversal  | Order           | Example above |
|------------|-----------------|---------------|
| Pre-order  | Root → L → R    | 1, 2, 4, 5, 3 |
| In-order   | L → Root → R    | 4, 2, 5, 1, 3 |
| Post-order | L → R → Root    | 4, 5, 2, 3, 1 |

<p>
  <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/main/assets/in_order.png" alt="In-order traversal" width="400"/>
</p>

> Source: [`binary_trees/`](binary_trees/) · [`tree/`](tree/)

---

### Heap

A complete binary tree stored as a flat list. Provides O(log n) insert and O(log n) remove-min/max.

- **Max-heap**: parent ≥ children → root holds the maximum
- **Min-heap**: parent ≤ children → root holds the minimum

```
Max-heap example:
        10
       /  \
      9    8
     / \  / \
    5   6 7   3
```

**Index formulas for a 0-based list:**
```
left  child  of i → 2i + 1
right child  of i → 2i + 2
parent       of i → ⌊(i − 1) / 2⌋
```

<p>
  <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/main/assets/heap_property.png" alt="Heap property" width="450"/>
</p>

**Applications:** priority queues, heap sort, Dijkstra's algorithm.

> Source: [`heap/`](heap/)

---

### Hash Table

Maps keys to values in O(1) average time using a hash function.

- **Hash Map** – key-value pairs with fast lookup
- **Hash Set** – stores unique keys only

> Source: [`hash_tables/`](hash_tables/)

---

### Graph

A set of **vertices** connected by **edges**.

| Type       | Description                         |
|------------|-------------------------------------|
| Directed   | Edges have a direction (one-way)    |
| Undirected | Edges are bidirectional             |
| Weighted   | Edges carry a numeric cost/weight   |

**Adjacency list representation:**

```
A → [B, C]
B → [D]
C → [D, E]
D → []
E → []
```

<p>
  <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/main/assets/adjacency_list.png" alt="Adjacency list" width="500"/>
</p>

> Source: [`graph/`](graph/)

---

## Algorithms

### Recursion

Every recursive solution needs:
1. A **base case** — the terminating condition
2. A **recurrence relation** — reduces the problem toward the base case

> Notes: [`Recursion.md`](Recursion.md)

---

### Sorting

| Algorithm       | Best     | Average  | Worst    | Stable |
|-----------------|----------|----------|----------|--------|
| Bubble sort     | O(n)     | O(n²)    | O(n²)    | Yes    |
| Selection sort  | O(n²)    | O(n²)    | O(n²)    | No     |
| Insertion sort  | O(n)     | O(n²)    | O(n²)    | Yes    |
| Merge sort      | O(n log n) | O(n log n) | O(n log n) | Yes |
| Quick sort      | O(n log n) | O(n log n) | O(n²)  | No     |

> Source: [`sorting/`](sorting/)

### Binary Search

Finds a target in a sorted array in **O(log n)** by halving the search space each step.

```dart
int binarySearch(List<int> nums, int target) {
  int left = 0, right = nums.length - 1;
  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    if (nums[mid] == target) return mid;
    if (nums[mid] < target) left = mid + 1;
    else right = mid - 1;
  }
  return -1;
}
```

---

## Project Structure

```
.
├── big_o_notation/        # O(1), O(n), O(n²), O(log n) examples
├── basic/                 # Foundational Dart examples
├── array_string/          # Array & string problems
├── linked_list/           # Singly + doubly linked list implementations
├── stack/                 # Stack implementations & LeetCode challenges
├── queue/                 # 4 queue implementations
├── hash_tables/           # Hash map & hash set
├── binary_trees/          # Binary tree traversals
├── tree/                  # General tree
├── heap/                  # Min/max heap
├── graph/                 # Directed, undirected, weighted graphs
├── sorting/               # Bubble, selection, insertion sort
├── leet_code/             # 70+ LeetCode solutions
├── assets/                # Diagram images
└── pdf/                   # Grokking Algorithms summary
```

---

## LeetCode Solutions

70+ problems solved, mostly in Dart. Some are also available in Java, Python, Rust, C++, C#, or JavaScript.

### Arrays & Strings

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 1 | [Two Sum](leet_code/1_two_sums.dart) | ✅ | |
| 26 | [Array Partition I](leet_code/array_partition_1.dart) | ✅ | |
| 55 | [Jump Game](leet_code/55_jump_game.dart) | ✅ | |
| 66 | [Plus One](leet_code/66_pluse_one.dart) | ✅ | |
| 75 | [Sort Colors](leet_code/75_sort_colors.dart) | ✅ | |
| 125 | [Valid Palindrome](leet_code/125_valid_Palindrome.dart) | ✅ | |
| 136 | [Single Number](leet_code/136_single_number.dart) | ✅ | |
| 169 | [Majority Element](leet_code/169_majority_element.dart) | ✅ | |
| 189 | [Rotate Array](leet_code/189_rotate_array.dart) | ✅ | |
| 217 | [Contains Duplicate](leet_code/217_contains_duplicate.dart) | ✅ | |
| 344 | [Reverse String](leet_code/344_reverse_string.dart) | ✅ | |
| 350 | [Intersection of Two Arrays II](leet_code/350_intersection_of_two_arrays_II.dart) | ✅ | |
| 412 | [FizzBuzz](leet_code/412_fizz_buzz.dart) | ✅ | C# |
| 442 | [Find All Duplicates in an Array](leet_code/442_find_all_duplicates_in_an_array.dart) | ✅ | |
| 448 | [Find All Numbers Disappeared in an Array](leet_code/448.%20Find%20All%20Numbers%20Disappeared%20in%20an%20Array.dart) | ✅ | |
| 724 | [Find Pivot Index](leet_code/724_find_pivot_index.dart) | ✅ | |
| 747 | [Largest Number At Least Twice of Others](leet_code/747.%20Largest%20Number%20At%20Least%20Twice%20of%20Others.dart) | ✅ | |
| 912 | [Sort an Array](leet_code/912_sort_an_array.dart) | ✅ | |
| 1051 | [Height Checker](leet_code/1051_height_checker.dart) | ✅ | |
| 1480 | [Running Sum of 1D Array](leet_code/1480_running_sum_of_1d_array.dart) | ✅ | Java, JS |
| 1672 | [Richest Customer Wealth](leet_code/1672_richest_customer_wealth.dart) | ✅ | |
| 3105 | [Longest Strictly Inc/Dec Subarray](leet_code/3105_longest_strictly_increasing_or_strictly_decreasing_subarray.dart) | ✅ | |
| 3442 | [Max Difference Between Even and Odd Frequency](leet_code/3442.%20Maximum%20Difference%20Between%20Even%20and%20Odd%20Frequency.dart) | ✅ | |
| — | [Merge Sorted Array](leet_code/Merge%20Sorted%20Array.dart) | ✅ | |
| — | [Length of Last Word](leet_code/length_of_last_word.dart) | ✅ | |

### Strings & Hashing

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 5 | [Longest Palindromic Substring](leet_code/5_longest_palindromic_substring.dart) | ✅ | |
| 6 | [Zigzag Conversion](leet_code/6_zigzag_conversion.dart) | ✅ | |
| 9 | [Palindrome Number](leet_code/9_palindrome_number.dart) | ✅ | |
| 3 | [Longest Substring Without Repeating Characters](leet_code/3_longest_substring_without_repeating_characters.dart) | ✅ | |
| 205 | [Isomorphic Strings](leet_code/205_isomorphic_strings.dart) | ✅ | |
| 242 | [Valid Anagram](leet_code/242_valid_anagram.dart) | ✅ | |
| 387 | [First Unique Character in a String](leet_code/387_first_unique_character_in_a_string.dart) | ✅ | |
| 1544 | [Make the String Great](leet_code/1544_make_the_string_great.dart) | ✅ | |
| 2351 | [First Letter to Appear Twice](leet_code/2351_first_letter_to_appear_twice.dart) | ✅ | |
| 3106 | [Lexicographically Smallest String After Operations](leet_code/3106_lexicographically_smallest_string_after_operations_with_constraint.cp) | | C++ |

### Math & Bit Manipulation

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 7 | [Reverse Integer](leet_code/7_reverse_integer.dart) | ✅ | |
| 202 | [Happy Number](leet_code/202_happy_number.dart) | ✅ | |
| 263 | [Ugly Number](leet_code/263_ugly_number.dart) | ✅ | |
| 1342 | [Number of Steps to Reduce a Number to Zero](leet_code/1342_number_of_steps_to_reduce_a_number_to_zero.dart) | ✅ | |
| 2169 | [Count Operations to Obtain Zero](leet_code/2169_count_operations_to_obtain_zero.dart) | ✅ | |
| 100263 | [Harshad Number](leet_code/100263._harshad_number.dart) | ✅ | |
| 100266 | [Count Alternating Subarrays](leet_code/100266_count_alternating_subarrays.dart) | ✅ | |

### Linked Lists

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 2 | [Add Two Numbers](leet_code/2_add_two_numbers.dart) | ✅ | |
| 143 | [Reorder List](leet_code/143_reorder_list.dart) | ✅ | |
| 147 | [Insertion Sort List](leet_code/147_insertion_sort_list.dart) | ✅ | |
| 206 | [Reverse Linked List](leet_code/206.%20Reverse%20Linked%20List.dart) | ✅ | |
| 287 | [Find the Duplicate Number](leet_code/287_find%20_the_duplicate_number.dart) | ✅ | |
| 876 | [Middle of the Linked List](leet_code/876_middle_of_the_linked_list.dart) | ✅ | C# |
| — | [Delete Node in a Linked List](leet_code/Delete%20Node%20in%20a%20Linked%20List.dart) | ✅ | Java |

### Stacks & Queues

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 20 | [Valid Parentheses](leet_code/20.%20Valid%20Parentheses.dart) | ✅ | |
| 678 | [Valid Parenthesis String](leet_code/678_valid_parenthesis_string.dart) | ✅ | |
| 1249 | [Minimum Remove to Make Valid Parentheses](leet_code/1249_minimum_remove_to_make_valid_parentheses.dart) | ✅ | |
| 1614 | [Maximum Nesting Depth of Parentheses](leet_code/1614._maximum_nesting_depth_of_the_parentheses.dart) | ✅ | |
| 1700 | [Number of Students Unable to Eat Lunch](leet_code/1700_number_of_students_unable_to_eat_lunch.dart) | ✅ | |
| 2073 | [Time Needed to Buy Tickets](leet_code/2073_time_needed_to_buy_tickets.dart) | ✅ | |

### Trees & Graphs

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 94 | [Binary Tree Inorder Traversal](leet_code/94.%20Binary%20Tree%20Inorder%20Traversal.dart) | ✅ | |
| 144 | [Binary Tree Preorder Traversal](leet_code/144.%20Binary%20Tree%20Preorder%20Traversal.dart) | ✅ | |
| 226 | [Invert Binary Tree](binary_trees/226.%20Invert%20Binary%20Tree.dart) | ✅ | |
| 404 | [Sum of Left Leaves](leet_code/404.%20Sum%20of%20Left%20Leaves.dart) | ✅ | |
| 704 | [Binary Search](leet_code/704.%20Binary%20Search.dart) | ✅ | |
| 851 | [Loud and Rich](leet_code/851_loud_and_rich.dart) | ✅ | |
| 977 | [Find the Town Judge](leet_code/977_find_the_town_judge.dart) | ✅ | |
| 2192 | [All Ancestors of a Node in a DAG](leet_code/2192.%20All%20Ancestors%20of%20a%20Node%20in%20a%20Directed%20Acyclic%20Graph.dart) | ✅ | Rust |
| 3108 | [Minimum Cost Walk in Weighted Graph](leet_code/3108.dart) | ✅ | Java |

### Hard / Multi-concept

| # | Problem | Dart | Other |
|---|---------|------|-------|
| 4 | [Median of Two Sorted Arrays](leet_code/4_median_of_two_sorted_arrays.dart) | ✅ | |
| 37 | [Sudoku Solver](leet_code/37_sudoku_solver.dart) | ✅ | |
| 41 | [First Missing Positive](leet_code/41.%20First%20Missing%20Positive.dart) | ✅ | |
| 122 | [Best Time to Buy and Sell Stock II](leet_code/122_best_time_to_buy_and_sell_stock_II.dart) | ✅ | |
| 100240 | [Minimize Manhattan Distances](leet_code/100240_minimize_manhattan_distances.dart) | ✅ | Java, Python |
| 3100 | [Water Bottles II](leet_code/3100_water_bottles_II.dart) | ✅ | Java, Python |
| 3107 | [Minimum Operations to Make Median Equal to K](leet_code/3107.dart) | ✅ | Python |

---

## Running a Solution

Any file can be run directly with the Dart SDK:

```bash
dart run leet_code/1_two_sums.dart
```

Or open the project in **Android Studio / VS Code** with the Dart plugin and run individual files.

---

## References

- [Introduction to Algorithms, 3rd Edition](https://www.amazon.com/Introduction-Algorithms-3rd-MIT-Press/dp/0262033844)
- [Grokking Algorithms](https://www.manning.com/books/grokking-algorithms)
- [Data Structures & Algorithms in Dart (Second Edition)](https://www.amazon.com/Data-Structures-Algorithms-Dart-Second/dp/195032589X)
- [LeetCode Explore](https://leetcode.com/explore/)
