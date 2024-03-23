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

- You can create a queue using four different internal data structures:
  - List
  - Doubly linked list
  - Ring buffer
  - Two stacks
