import 'swap.dart';
void selectionSort<E extends Comparable<dynamic>>(List<E> list)
{
// 1
  for (var start = 0; start < list.length - 1; start++) {
    var lowest = start;
// 2
    for (var next = start + 1; next < list.length; next++) {
      if (list[next].compareTo(list[lowest]) < 0) {
        lowest = next;
      }
    }
// 3
    if (lowest != start) {
      list.swap(lowest, start);
    }
  }
}

// Here’s what’s going on:
// 1. The outer for loop represents the passes, where start is the index the current
// pass should begin at. Since the lowest value is moved to start at the end of every
// pass, start increments by one each time.
// 2. In every pass, you go through the remainder of the collection to find the element
// with the lowest value.
// 3. If a lower value was found, then swap it with the value at the start index.
void main() {
  final list = [9, 4, 10, 3];
  print('Original: $list');
  selectionSort(list);
  print('Selection sorted: $list');
}