# Linked List

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/129c2fd7ce2782ac4604576d69ac77edcc92df30/assets/linked_list.png"  alt="linked list"/>
</p>

- A linked list is a collection of values arranged in a linear, unidirectional sequence. 
- It has several theoretical advantages over contiguous storage options such as the Dart List :
 - Constant time insertion and removal from the front of the list.
 - Reliable performance characteristics.
- A linked list is a chain of nodes:
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
