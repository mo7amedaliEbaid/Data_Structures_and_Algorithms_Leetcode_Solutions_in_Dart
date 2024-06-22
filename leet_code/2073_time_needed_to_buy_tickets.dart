// There are n people in a line queuing to buy tickets, where the 0th person is at the front of the line and the (n - 1)th person is at the back of the line.
//
// You are given a 0-indexed integer array tickets of length n where the number of tickets that the ith person would like to buy is tickets[i].
//
// Each person takes exactly 1 second to buy a ticket. A person can only buy 1 ticket at a time and has to go back to the end of the line (which happens instantaneously) in order to buy more tickets. If a person does not have any tickets left to buy, the person will leave the line.
//
// Return the time taken for the person at position k (0-indexed) to finish buying tickets.
//
//
//
// Example 1:
//
// Input: tickets = [2,3,2], k = 2
// Output: 6
// Explanation:
// - In the first pass, everyone in the line buys a ticket and the line becomes [1, 2, 1].
// - In the second pass, everyone in the line buys a ticket and the line becomes [0, 1, 0].
// The person at position 2 has successfully bought 2 tickets and it took 3 + 3 = 6 seconds.
// Example 2:
//
// Input: tickets = [5,1,1,1], k = 0
// Output: 8
// Explanation:
// - In the first pass, everyone in the line buys a ticket and the line becomes [4, 0, 0, 0].
// - In the next 4 passes, only the person in position 0 is buying tickets.
// The person at position 0 has successfully bought 5 tickets and it took 4 + 1 + 1 + 1 + 1 = 8 seconds.
//1
/*class Solution {
  int timeRequiredToBuy(List<int> tickets, int k) {
    int n = tickets.length;
    List<int> queue = List.from(tickets);

    int time = 0;
    int idx = 0;

    while (queue[k] > 0) {
      if (queue[idx] > 0) {
        queue[idx]--;
        time++;
        if (idx == k && queue[k] == 0) break;
      }
      idx = (idx + 1) % n;
    }

    return time;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.timeRequiredToBuy([2, 3, 2], 2)); // Output: 6
}*/
// 2- Using Queue
import 'dart:collection';

class Solution {
  int timeRequiredToBuy(List<int> tickets, int k) {
    Queue<int> queue = Queue<int>();

    // Initialize the queue with ticket indices
    for (int i = 0; i < tickets.length; i++) {
      queue.add(i);
    }

    int time = 0;

    // Loop until the queue is empty
    while (queue.isNotEmpty) {
      // Increment the time counter for each iteration
      time++;

      // Get the front element of the queue
      int front = queue.removeFirst();

      // Buy a ticket for the front person
      tickets[front]--;

      // If person k bought all their tickets, return time
      if (k == front && tickets[front] == 0) {
        return time;
      }

      // Re-add the current index to the queue for the next iteration
      if (tickets[front] != 0) {
        queue.add(front);
      }
    }

    return time;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.timeRequiredToBuy([2, 3, 2], 2)); // Output: 6
}
