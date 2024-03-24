// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.


// Sol #1
/*class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, {this.next});
}*/

/*ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode dummyHead = ListNode(0);
  ListNode? p = l1, q = l2, curr = dummyHead;
  int carry = 0;

  while (p != null || q != null) {
    int x = (p != null) ? p.val : 0;
    int y = (q != null) ? q.val : 0;
    int sum = carry + x + y;
    carry = sum ~/ 10;
    curr?.next = ListNode(sum % 10);
    curr = curr?.next!;
    if (p != null) p = p.next;
    if (q != null) q = q.next;
  }

  if (carry > 0) {
    curr?.next = ListNode(carry);
  }

  return dummyHead.next;
}

Explanation:

We iterate through both linked lists simultaneously, adding corresponding digits along with any carry from the previous sum.
We maintain a dummy head node to simplify the code, and then create a new linked list for the result.
We keep track of the carry by dividing the sum by 10.
Finally, we check if there's any carry left after the loop and append a new node if needed.
The resulting linked list represents the sum of the two input numbers.

void main() {
  // Example usage
  ListNode l1 = ListNode(2, next: ListNode(4, next: ListNode(3)));
  ListNode l2 = ListNode(5, next: ListNode(6, next: ListNode(4)));

  ListNode? result = addTwoNumbers(l1, l2);
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}*/

// Sol #2
/*
class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  return sum(l1, l2, 0);
}

ListNode? sum(ListNode? l1, ListNode? l2, int q) {
  ListNode? node;
  var res = (l1?.val ?? 0) + (l2?.val ?? 0) + q;
  if (l1?.next != null || l2?.next != null) {
    node = ListNode(res % 10, sum(l1?.next, l2?.next, res ~/ 10));
  } else {
    node = ListNode(res % 10, res ~/ 10 > 0 ? ListNode(res ~/ 10) : null);
  }
  return node;
}

void main() {
  // Example usage
  ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));
  ListNode l2 = ListNode(5, ListNode(6, ListNode(4)));

  ListNode? result = addTwoNumbers(l1, l2);
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}
*/

// Sol #3
class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode dummyHead = ListNode();
  ListNode? p = l1, q = l2, curr = dummyHead;
  int carry = 0;

  while (p != null || q != null) {
    int x = (p != null) ? p.val : 0;
    int y = (q != null) ? q.val : 0;
    int sum = carry + x + y;
    carry = sum ~/ 10;
    curr?.next = ListNode(sum % 10);
    curr = curr?.next!;
    if (p != null) p = p.next;
    if (q != null) q = q.next;
  }

  if (carry > 0) {
    curr?.next = ListNode(carry);
  }

  return dummyHead.next;
}

void main() {
  // Example usage
  ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));
  ListNode l2 = ListNode(5, ListNode(6, ListNode(4)));

  ListNode? result = addTwoNumbers(l1, l2);
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}

