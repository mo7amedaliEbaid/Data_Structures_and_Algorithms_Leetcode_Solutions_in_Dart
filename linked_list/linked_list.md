# Linked List

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/129c2fd7ce2782ac4604576d69ac77edcc92df30/assets/linked_list.png"  alt="linked list"/>
</p>

- A linked list is a collection of values arranged in a linear, unidirectional sequence. 
- It has several theoretical advantages over contiguous storage options such as the Dart List.
 - Constant time insertion and removal from the front of the list.
 - Reliable performance characteristics.
- A linked list is a chain of nodes.
- Nodes have two responsibilities:
1. Hold a value.
2. Hold a reference to the next node. A null reference indicates the end of the list.
- A linked list has the concept of a head and tail, which refers to the first and last nodes of the list respectively.

## Adding Values to a List.
- There are three ways to add values to a linked list, each having its own unique performance characteristics:
  - push : Adds a value at the front of the list `head-first insertion`.
  - append : Adds a value at the end of the list `tail-end insertion`.
  - insertAfter : Adds a value after a particular node in the list.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/45b499c4d535d5344e671aec032ca704bb9854a8/assets/insert_performance.png"  alt="linked list"/>
</p>

## Removing Values From a List.
- There are three main operations for removing nodes:
  - pop : Removes the value at the front of the list.
  - removeLast : Removes the value at the end of the list.
  - removeAfter : Removes the value after a particular node in the list.

- removeLast requires you to traverse all the way down the list. This makes for an O(n) operation, which is relatively expensive.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/a07c5b5ebd1e0adbb8d0620ecc03ba75ffab3c2d/assets/remove_performance.png"  alt="linked list"/>
</p>

- Note: The dart:collection library also contains a class named LinkedList . It only accepts elements of type LinkedListEntry , though, so it isn’t as flexible as yours was for making a list of arbitrary values. Additionally, the Dart version is a doubly linked list (linking to previous as well as next elements), whereas yours was a singly linked list. If you want to use a standard Dart collection that allows adding and removing at the ends in constant or amortized constant time, check out the Queue class.

### Linked lists are linear and unidirectional. As soon as you move a reference from one node to another, you can’t go back.
### Linked lists have O(1) time complexity for head first insertions, whereas standard lists have O(n) time complexity for head-first insertions.
### Implementing the Dart Iterable interface allows you to loop through the elements of a collection as well as offering a host of other helpful methods.
