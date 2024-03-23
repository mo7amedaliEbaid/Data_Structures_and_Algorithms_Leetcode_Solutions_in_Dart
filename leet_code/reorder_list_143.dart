/*You are given the head of a singly linked-list. The list can be represented as:

L0 → L1 → … → Ln - 1 → Ln
Reorder the list to be on the following form:

L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
You may not modify the values in the list's nodes. Only nodes themselves may be changed.*/

/*
Input: head = [1,2,3,4]
Output: [1,4,2,3]*/

//  Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

main() {
  Solution solution = Solution();
  ListNode head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))));
  printList(head);
  solution.reorderList(head);
  print('\nReordered list:');
  printList(head);
}

void printList(ListNode? head) {
  ListNode? current = head;
  while (current != null) {
    if (current.next != null) {
      print('${current.val} -> ');
    } else {
      print('${current.val}');
    }
    current = current.next;
  }
}

class Solution {
  void reorderList(ListNode? head) {
    ListNode? itr = head;
    List<ListNode?> vals = [];
    while (itr != null) {
      vals.add(itr);
      itr = itr.next;
    }
    List<ListNode?> return_list = [];
    return_list.add(vals[0]);

    for (int i = 0; return_list.length < vals.length + 1; ++i) {
      return_list.add(vals[i]);
      return_list.add(vals[vals.length - 1 - i]);
    }

    for (int i = 0; i < return_list.length - 1; ++i) {
      return_list[i]?.next = return_list[i + 1];
    }
    if (vals.length % 2 == 1) {
      return_list[return_list.length - 2]?.next = null;
    } else {
      return_list[return_list.length - 1]?.next = null;
    }
  }
}
