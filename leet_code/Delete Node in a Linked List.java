**
    * Definition for singly-linked list.
    * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
  public void deleteNode(ListNode node) {
    // Update the value of the given node to be equal to the value of its next node
    node.val = node.next.val;
    // Update the next pointer to skip the next node
    node.next = node.next.next;
  }
}