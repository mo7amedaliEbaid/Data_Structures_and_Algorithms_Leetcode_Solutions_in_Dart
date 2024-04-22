class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val);
}

class MyLinkedList {
  ListNode? head;
  int length;

  MyLinkedList() : length = 0 {
    head = null;
  }

  int get(int index) {
    if (index < 0 || index >= length || head == null) return -1;
    ListNode? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }
    return current!.val;
  }

  void addAtHead(int val) {
    ListNode newNode = ListNode(val);
    newNode.next = head;
    head = newNode;
    length++;
  }

  void addAtTail(int val) {
    ListNode newNode = ListNode(val);
    if (head == null) {
      head = newNode;
    } else {
      ListNode? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
    length++;
  }

  void addAtIndex(int index, int val) {
    if (index < 0 || index > length) return;
    if (index == 0) {
      addAtHead(val);
      return;
    }
    ListNode newNode = ListNode(val);
    ListNode? current = head;
    for (int i = 0; i < index - 1; i++) {
      current = current!.next;
    }
    newNode.next = current!.next;
    current.next = newNode;
    length++;
  }

  void deleteAtIndex(int index) {
    if (index < 0 || index >= length || head == null) return;
    if (index == 0) {
      head = head!.next;
      length--;
      return;
    }
    ListNode? current = head;
    for (int i = 0; i < index - 1; i++) {
      current = current!.next;
    }
    current!.next = current.next!.next;
    length--;
  }
}

void main() {
  MyLinkedList myLinkedList = MyLinkedList();
  myLinkedList.addAtHead(1);
  myLinkedList.addAtTail(3);
  myLinkedList.addAtIndex(1, 2);
  print(myLinkedList.get(1)); // Output: 2
  myLinkedList.deleteAtIndex(1);
  print(myLinkedList.get(1)); // Output: 3
}
