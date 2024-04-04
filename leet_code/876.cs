public class Solution {
    public ListNode MiddleNode(ListNode head) {
        if (head == null)
            return head;

        ListNode n1 = head,
                 n2 = head.next;

        while (n2 != null)
        {
            n1 = n1.next;

            if (n2.next != null)
                n2 = n2.next.next;
            else
                n2 = null;
        }

        return n1;
    }
}
