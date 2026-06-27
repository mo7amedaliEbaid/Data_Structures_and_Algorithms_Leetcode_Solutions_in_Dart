# README Context & Update Guide

This file describes the current state and conventions of `README.md` so future updates stay consistent.

---

## README Structure

```
README.md
├── Big O Notation          — complexity table + bigO.png image
├── Data Structures         — one section per structure with ASCII diagram, complexity table, asset image
│   ├── Linked List
│   ├── Stack
│   ├── Queue
│   ├── Binary Tree
│   ├── Heap
│   ├── Hash Table
│   └── Graph
├── Algorithms
│   ├── Recursion
│   ├── Sorting             — comparison table (Best/Avg/Worst/Stable)
│   └── Binary Search       — code snippet
├── Project Structure       — directory tree
├── LeetCode Solutions      — 7 category tables (see below)
├── Running a Solution      — dart run command
└── References              — 4 book/site links
```

---

## LeetCode Table Categories

Problems are grouped by topic in this order:

| Category | Examples |
|---|---|
| Arrays & Strings | Two Sum, Sort Colors, Rotate Array |
| Strings & Hashing | Valid Anagram, Longest Palindromic Substring |
| Math & Bit Manipulation | Happy Number, Reverse Integer |
| Linked Lists | Reverse Linked List, Add Two Numbers |
| Stacks & Queues | Valid Parentheses, Time to Buy Tickets |
| Trees & Graphs | Binary Tree Traversal, Find the Town Judge |
| Hard / Multi-concept | Sudoku Solver, Median of Two Sorted Arrays |

### Table columns

```markdown
| # | Problem | Dart | Other |
```

- `#` — LeetCode problem number (or `—` if it has no number / contest problem)
- `Problem` — display name linked to the file path
- `Dart` — `✅` if a `.dart` solution exists
- `Other` — comma-separated language names if additional language files exist (e.g. `Java, Python`)

---

## How to Update the README

### Adding a new LeetCode solution

1. Identify the problem number and title.
2. Pick the correct category from the table above. If it fits multiple, prefer the primary data structure used.
3. Add a row in the right category table, keeping rows sorted by problem number within the category.
4. Fill in `Other` if additional language files exist (check `leet_code/` for `.java`, `.py`, `.rs`, `.cpp`, `.cs`, `.js` variants).

### Adding a new data structure or algorithm

1. Add a new `###` section under **Data Structures** or **Algorithms**.
2. Include: a short definition, an ASCII diagram or concept illustration, a complexity table if applicable, and an image from `assets/` if one exists.
3. Add the folder to the **Project Structure** tree.

### Adding a new asset image

Reference images using the raw GitHub URL pattern already used in other sections:
```
https://github.com/mo7amedaliEbaid/ds_dart/blob/main/assets/<filename>.png
```

---

## Current Problem Count

As of the last README update: **70+ LeetCode solutions** across all categories.

When the count crosses a round milestone (e.g. 80, 100), update the sentence in the **LeetCode Solutions** section header.

---

## File Naming Conventions in `leet_code/`

| Pattern | Example |
|---|---|
| `<number>_<snake_case_title>.dart` | `1_two_sums.dart` |
| `<number>. <Title>.dart` | `20. Valid Parentheses.dart` |
| `<descriptive_name>.dart` | `length_of_last_word.dart` |

Both naming styles exist — link to whichever file is actually present (check exact filename before writing the link).
