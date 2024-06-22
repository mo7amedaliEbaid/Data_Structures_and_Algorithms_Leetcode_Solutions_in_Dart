// You are given a 0-indexed array points representing integer coordinates of some points on a 2D plane, where points[i] = [xi, yi].
//
// The distance between two points is defined as their Manhattan distance.
//
// Return the minimum possible value for maximum distance between any two points by removing exactly one point.
//
//
//
// Example 1:
//
// Input: points = [[3,10],[5,15],[10,2],[4,4]]
// Output: 12
// Explanation: The maximum distance after removing each point is the following:
// - After removing the 0th point the maximum distance is between points (5, 15) and (10, 2), which is |5 - 10| + |15 - 2| = 18.
// - After removing the 1st point the maximum distance is between points (3, 10) and (10, 2), which is |3 - 10| + |10 - 2| = 15.
// - After removing the 2nd point the maximum distance is between points (5, 15) and (4, 4), which is |5 - 4| + |15 - 4| = 12.
// - After removing the 3rd point the maximum distance is between points (5, 15) and (10, 2), which is |5 - 10| + |15 - 2| = 18.
// It can be seen that 12 is the minimum possible maximum distance between any two points after removing exactly

// wrong answer
import 'dart:math';

class Solution {
  int minimumDistance(List<List<int>> points) {
    int minMaxDistance = 0;

    // Calculate initial max distance without removing any point
    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        int distance = (points[i][0] - points[j][0]).abs() +
            (points[i][1] - points[j][1]).abs();
        minMaxDistance = max(minMaxDistance, distance);
      }
    }

    // Try removing each point and recalculate max distance
    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        int maxDistanceWithoutPoint = 0;
        for (int k = 0; k < points.length; k++) {
          if (k != i && k != j) {
            int distance = (points[i][0] - points[k][0]).abs() +
                (points[i][1] - points[k][1]).abs();
            maxDistanceWithoutPoint = max(maxDistanceWithoutPoint, distance);
          }
        }
        minMaxDistance = min(minMaxDistance, maxDistanceWithoutPoint);
      }
    }

    return minMaxDistance;
  }
}

void main() {
  Solution solution = Solution();
  List<List<int>> points = [
    [3, 2],
    [3, 9],
    [7, 10],
    [4, 4],
    [8, 10],
    [2, 7]
  ];
  print(solution.minimumDistance(points)); // Output: 10
}




