// The school cafeteria offers circular and square sandwiches at lunch break, referred to by numbers 0 and 1 respectively. All students stand in a queue. Each student either prefers square or circular sandwiches.
//
// The number of sandwiches in the cafeteria is equal to the number of students. The sandwiches are placed in a stack. At each step:
//
// If the student at the front of the queue prefers the sandwich on the top of the stack, they will take it and leave the queue.
// Otherwise, they will leave it and go to the queue's end.
// This continues until none of the queue students want to take the top sandwich and are thus unable to eat.
//
// You are given two integer arrays students and sandwiches where sandwiches[i] is the type of the i​​​​​​th sandwich in the stack (i = 0 is the top of the stack) and students[j] is the preference of the j​​​​​​th student in the initial queue (j = 0 is the front of the queue). Return the number of students that are unable to eat.
//
//
//
// Example 1:
//
// Input: students = [1,1,0,0], sandwiches = [0,1,0,1]
// Output: 0
// Explanation:
// - Front student leaves the top sandwich and returns to the end of the line making students = [1,0,0,1].
// - Front student leaves the top sandwich and returns to the end of the line making students = [0,0,1,1].
// - Front student takes the top sandwich and leaves the line making students = [0,1,1] and sandwiches = [1,0,1].
// - Front student leaves the top sandwich and returns to the end of the line making students = [1,1,0].
// - Front student takes the top sandwich and leaves the line making students = [1,0] and sandwiches = [0,1].
// - Front student leaves the top sandwich and returns to the end of the line making students = [0,1].
// - Front student takes the top sandwich and leaves the line making students = [1] and sandwiches = [1].
// - Front student takes the top sandwich and leaves the line making students = [] and sandwiches = [].
// Hence all students are able to eat.
// Example 2:
//
// Input: students = [1,1,1,0,0,1], sandwiches = [1,0,0,0,1,1]
// Output: 3

import 'dart:collection';

class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    // Initialize a queue to represent the line of students
    Queue<int> queue = Queue<int>.from(students);

    // Iterate through the sandwiches
    for (int sandwich in sandwiches) {
      // Check if the student at the front of the queue prefers this sandwich
      if (queue.isNotEmpty && queue.first == sandwich) {
        queue.removeFirst(); // Student takes the sandwich and leaves the queue
      } else {
        // Student doesn't prefer this sandwich, so move to the end of the queue
        int count = 0;
        while (queue.isNotEmpty && queue.first != sandwich) {
          queue.addLast(queue.removeFirst());
          count++;
          // If all students are unable to eat, return the count of students
          if (count == queue.length) return count;
        }
        // After rearranging, check if the current student can eat
        if (queue.isNotEmpty && queue.first == sandwich) {
          queue.removeFirst(); // Student takes the sandwich and leaves the queue
        }
      }
    }
    // All students were able to eat
    return 0;
  }
}

void main() {
  Solution solution = Solution();

  // Example 1
  List<int> students1 = [1,1,0,0];
  List<int> sandwiches1 = [0,1,0,1];
  print(solution.countStudents(students1, sandwiches1)); // Output: 0
}
