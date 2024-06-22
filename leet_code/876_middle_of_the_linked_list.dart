// Given the head of a singly linked list, return the middle node of the linked list.
//
// If there are two middle nodes, return the second middle node.
//
//
//
// Example 1:
//
//
// Input: head = [1,2,3,4,5]
// Output: [3,4,5]
// Explanation: The middle node of the list is node 3.
// Example 2:
//
//
// Input: head = [1,2,3,4,5,6]
// Output: [4,5,6]
// Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.



// To find the middle node of a singly linked list in Dart, you can use the two-pointer approach.
// One pointer moves one step at a time while the other pointer moves two steps at a time.
// When the faster pointer reaches the end of the list, the slower pointer will be at the middle node.

/*class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? middleNode(ListNode? head) {
    if (head == null) return null;

    ListNode? slow = head;
    ListNode? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }

    return slow;
  }
}

void main() {
  ListNode node1 = ListNode(1);
  ListNode node2 = ListNode(2);
  ListNode node3 = ListNode(3);
  ListNode node4 = ListNode(4);
  ListNode node5 = ListNode(5);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;

  Solution solution = Solution();
  ListNode? middle = solution.middleNode(node1);

  // Printing the middle node and the rest of the linked list
  while (middle != null) {
    print(middle.val);
    middle = middle.next;
  }
}*/
// In this code:
//
// We define a ListNode class to represent each node in the linked list.
// We define a Solution class with a method middleNode that takes the head of the linked list as input and returns the middle node.
// We initialize two pointers, slow and fast, both pointing to the head of the list initially.
// We iterate through the list using the two-pointer technique until fast reaches the end of the list. During each iteration, slow moves one step forward, and fast moves two steps forward.
// After the loop, slow will be pointing to the middle node.
// Finally, we return the slow pointer which is the middle node of the linked list.


// Array Approach

// If you want to solve this problem using an array approach, you can first traverse the linked list to count its length.
// Then, you can calculate the index of the middle node and traverse the list again to reach that index.
class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? middleNode(ListNode? head) {
    if (head == null) return null;

    List<ListNode?> nodes = [];
    ListNode? current = head;

    // Traverse the linked list and store each node in an array
    while (current != null) {
      nodes.add(current);
      current = current.next;
    }

    // Calculate the index of the middle node
    int middleIndex = nodes.length ~/ 2;

    // Return the middle node
    return nodes[middleIndex];
  }
}

void main() {
  ListNode node1 = ListNode(1);
  ListNode node2 = ListNode(2);
  ListNode node3 = ListNode(3);
  ListNode node4 = ListNode(4);
  ListNode node5 = ListNode(5);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;

  Solution solution = Solution();
  ListNode? middle = solution.middleNode(node1);

  // Printing the middle node and the rest of the linked list
  while (middle != null) {
    print(middle.val);
    middle = middle.next;
  }
}
// In this code:
//
// We define a ListNode class to represent each node in the linked list.
// We define a Solution class with a method middleNode that takes the head of the linked list as input and returns the middle node.
// We initialize an empty list nodes to store the nodes of the linked list.
// We traverse the linked list and store each node in the nodes list.
// After traversing the list, we calculate the index of the middle node by dividing the length of the list by 2 (using integer division).
// Finally, we return the middle node by accessing the corresponding index in the nodes list.