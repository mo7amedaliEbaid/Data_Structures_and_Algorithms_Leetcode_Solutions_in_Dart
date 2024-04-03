
// In a town, there are n people labeled from 1 to n. There is a rumor that one of these people is secretly the town judge.
//
// If the town judge exists, then:
//
// The town judge trusts nobody.
// Everybody (except for the town judge) trusts the town judge.
// There is exactly one person that satisfies properties 1 and 2.
// You are given an array trust where trust[i] = [ai, bi] representing that the person labeled ai trusts the person labeled bi. If a trust relationship does not exist in trust array, then such a trust relationship does not exist.
//
// Return the label of the town judge if the town judge exists and can be identified, or return -1 otherwise.
//
//
//
// Example 1:
//
// Input: n = 2, trust = [[1,2]]
// Output: 2
// Example 2:
//
// Input: n = 3, trust = [[1,3],[2,3]]
// Output: 3
// Example 3:
//
// Input: n = 3, trust = [[1,3],[2,3],[3,1]]
// Output: -1

class Solution {
  int findJudge(int n, List<List<int>> trust) {
    // Initialize arrays to keep track of trust counts
    List<int> trustsReceived = List.filled(n + 1, 0);
    List<int> trustsPlaced = List.filled(n + 1, 0);

    // Iterate through the trust relationships
    for (List<int> relation in trust) {
      int a = relation[0];
      int b = relation[1];
      // Increment trust counts
      trustsReceived[b]++;
      trustsPlaced[a]++;
    }

    // Check for the town judge
    for (int i = 1; i <= n; i++) {
      if (trustsReceived[i] == n - 1 && trustsPlaced[i] == 0) {
        return i;
      }
    }

    // No town judge found
    return -1;
  }
}

void main() {
  Solution solution = Solution();

  // Test cases
  print(solution.findJudge(2, [[1, 2]])); // Output: 2
  print(solution.findJudge(3, [[1, 3], [2, 3]])); // Output: 3
  print(solution.findJudge(3, [[1, 3], [2, 3], [3, 1]])); // Output: -1
}
