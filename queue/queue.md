# Queues.
- Queues use FIFO (first-in-first-out) ordering, meaning the first element that was added will always be the first to be removed. Queues are handy when you need to maintain the order of your elements to process later.
```dart
abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}
```
- These are the meanings of the core operations:
  - enqueue : Insert an element at the back of the queue. Return true if the operation was successful.
  - dequeue : Remove the element at the front of the queue and return it.
  - isEmpty : Check if the queue is empty.
  - peek : Return the element at the front of the queue without removing it.
<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/0386069ac0a2422114b989396bb25f97106870c4/assets/queue.png"  alt="linked list"/>
</p>

 ## You can create a queue using four different internal data structures:
  - List

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/78295a524808ebcf8440435a5a0d737f15a20db6/assets/list_based_queue.png"  alt="linked list"/>
</p>

   - Doubly linked list
<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/99c80aa784d6989c9216d6aedc93d1dc3a005036/assets/doubly_liked_list.png"  alt="linked list"/>
</p>

  - Ring buffer
<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/6286d36f0415a270b2c1556441eff56041151c41/assets/ring_buffer_queue.png"  alt="linked list"/>
</p>

  - Two stacks
<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/ds_dart/blob/6286d36f0415a270b2c1556441eff56041151c41/assets/double_stack_queue.png"  alt="linked list"/>
</p>

## Explain the difference between a stack and a queue. Provide two real-life examples for each data structure.
### Queues have a behavior of first-in-first-out. What comes in first must come out first.
### Items in the queue are inserted from the rear and removed from the front.
### Queue Examples:
- 1. Line in a movie theatre: You would hate for people to cut the line at the movie theatre when buying tickets!
- 2. Printer: Multiple people could print documents from a printer in a similar first-come-first-serve manner.
###  Stacks have a behavior of last-in-first-out. Items on the stack are inserted at the top and removed from the top.
###  Stack Examples:
- 1. Stack of plates: You stack plates on top of each other and remove the top plate every time you use one. Isn’t this easier than grabbing the one at the bottom?
- 2. Undo functionality: Imagine typing words on a keyboard. Clicking Ctrl-Z will undo the most recent text you typed.