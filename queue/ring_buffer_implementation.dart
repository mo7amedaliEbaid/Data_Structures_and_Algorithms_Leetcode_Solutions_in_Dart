// A ring buffer, also known as a circular buffer, is a fixed-size list. This data structure
// strategically wraps around to the beginning when there are no more items to remove
// at the end.

// You first create a ring buffer that has a fixed size of 4. The ring buffer has two
// pointers that keep track of two things:
// 1. The read pointer keeps track of the front of the queue.
// 2. The write pointer keeps track of the next available slot so that you can
// overwriteexisting elements that have already been read.

// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'queue.dart';

class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);

  final List<E?> _list;
  int _writeIndex = 0;
  int _readIndex = 0;
  int _size = 0;

  bool get isFull => _size == _list.length;

  bool get isEmpty => _size == 0;

  void write(E element) {
    if (isFull) throw Exception('Buffer is full');
    _list[_writeIndex] = element;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  int _advance(int index) {
    return (index == _list.length - 1) ? 0 : index + 1;
  }

  E? read() {
    if (isEmpty) return null;
    final element = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;
    return element;
  }

  E? get peek => (isEmpty) ? null : _list[_readIndex];

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');
    int index = _readIndex;
    while (index != _writeIndex) {
      if (index != _readIndex) {
        text.write(', ');
      }
      text.write(_list[index % _list.length]);
      index++;
    }
    text.write(']');
    return text.toString();
  }
}

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);
  final RingBuffer<E> _ringBuffer;

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

// There are a couple of points to pay attention to:
// • You must include a length parameter since the ring buffer has a fixed size.
// • isEmpty and peek are already implemented. Both of these are O(1) operations.

main(){
  final queue = QueueRingBuffer<String>(10);
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue); // [Ray, Brian, Eric]
  queue.dequeue();
  print(queue); // [Brian, Eric]
  queue.peek;
  print(queue); // [Brian, Eric]
}

// The ring-buffer-based queue has the same time complexity for enqueue and dequeue
// as the linked-list implementation. The space complexity for a ring-buffer-based
// queue, while still O(n), doesn’t require new memory allocation internally when
// enqueuing new elements like the linked-list implementation does. However, the ring
// buffer has a fixed size, which means that enqueue can fail.