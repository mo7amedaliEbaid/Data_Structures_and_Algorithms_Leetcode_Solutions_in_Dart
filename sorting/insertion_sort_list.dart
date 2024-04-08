// Given the head of a singly linked list, sort the list using insertion sort, and return the sorted list's head.
//
// The steps of the insertion sort algorithm:
//
// Insertion sort iterates, consuming one input element each repetition and growing a sorted output list.
// At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list and inserts it there.
// It repeats until no input elements remain.
// The following is a graphical example of the insertion sort algorithm. The partially sorted list (black) initially contains only the first element in the list. One element (red) is removed from the input data and inserted in-place into the sorted list with each iteration.
//
//
//
//
// Example 1:
//
//
// Input: head = [4,2,1,3]
// Output: [1,2,3,4]

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? insertionSortList(ListNode? head) {
    if (head == null || head.next == null) {
      return head;
    }

    ListNode? dummy = ListNode(0);
    dummy.next = head;
    ListNode? current = head.next;
    ListNode? lastSorted = head;

    while (current != null) {
      if (lastSorted!.val <= current.val) {
        lastSorted = lastSorted.next;
      } else {
        ListNode? prev = dummy;
        while (prev!.next!.val <= current.val) {
          prev = prev.next;
        }
        lastSorted.next = current.next;
        current.next = prev.next;
        prev.next = current;
      }
      current = lastSorted!.next;
    }
    return dummy.next;
  }
}

void printList(ListNode? head) {
  while (head != null) {
    print("${head.val} -> ");
    head = head.next;
  }
  print("null");
}

void main() {
  Solution solution = Solution();
  ListNode head = ListNode(4, ListNode(2, ListNode(1, ListNode(3))));
  print("Original list:");
  printList(head);

  ListNode? sortedHead = solution.insertionSortList(head);
  print("\nSorted list:");
  printList(sortedHead);
}
