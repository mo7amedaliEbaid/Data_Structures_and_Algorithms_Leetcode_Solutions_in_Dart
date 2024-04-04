
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

// You can solve this problem in Dart by iterating through the trust array and keeping track
// of the count of trusts each person has received and trusts each person has placed.
// Then, you can check if there exists a person who is trusted by n-1 people and trusts nobody
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

// In Dart, List.filled(n + 1, 0) creates a list with a length of n + 1 where all elements are initialized to the value 0.
//
// Here's what each part means:
//
// List.filled: This is a constructor for creating a list with a specified length and filling it with a given value.
// n + 1: We use n + 1 instead of n because the people in the town are labeled from 1 to n. In Dart, list indices start from 0,
// so if we have n people labeled from 1 to n, we need a list of length n + 1 to accommodate them.
// 0: This is the value with which the list will be filled.
// We use List.filled(n + 1, 0) to initialize two lists, trustsReceived and trustsPlaced,
// to keep track of the number of trusts received by each person and the number of trusts placed by each person, respectively.
// Each index in these lists corresponds to a person labeled from 1 to n. We initialize them to 0 as initially, no trust relationships exist.
// Later, we update these counts based on the trust relationships provided in the input.



// for (int i = 1; i <= n; i++) {
//   if (trustsReceived[i] == n - 1 && trustsPlaced[i] == 0) {
//     return i;
//   }
// }
// int i = 1;: We initialize a loop variable i to 1.
// This loop variable represents the label of each person in the town.
// We start from 1 because in the problem statement, people are labeled from 1 to n.
//
// i <= n;: This condition ensures that we iterate through all the people in the town.
// Since people are labeled from 1 to n, we iterate while i is less than or equal to n.
//
// i++: After each iteration of the loop, we increment the loop variable i by 1, moving on to the next person's label.
//
// if (trustsReceived[i] == n - 1 && trustsPlaced[i] == 0) {: Within each iteration of the loop,
// we check if the current person with label i satisfies the conditions of being the town judge. We check if:
//
// trustsReceived[i] == n - 1: This condition checks if the current person has received trusts from all other people except themselves.
// For someone to be the town judge, they should be trusted by everyone except themselves. So, they should have received trusts from n - 1 people.
// trustsPlaced[i] == 0: This condition checks if the current person has placed no trusts. Since the town judge trusts nobody,
// they should not have placed any trusts themselves.
// return i;: If the conditions mentioned above are satisfied,
// it means that the current person with label i meets the criteria of being the town judge. So, we return their label i.
//
// In summary, this for loop iterates through each person labeled from 1 to n and checks if any of them satisfy the conditions of being the town judge.
// If such a person is found, their label is returned; otherwise, -1 is returned indicating that no town judge exists.

// for (List<int> relation in trust) {
//   int a = relation[0];
//   int b = relation[1];
//   // Increment trust counts
//   trustsReceived[b]++;
//   trustsPlaced[a]++;
// }
// for (List<int> relation in trust) {: This is a for-each loop that iterates through each element (relation) in the trust list.
// Each relation is a list of two integers, representing a trust relationship between two people.
// 
// int a = relation[0]; and int b = relation[1];: Within each iteration of the loop,
// we extract the two elements from the relation list. The first element (relation[0]) represents the person who places trust (a),
// and the second element (relation[1]) represents the person who receives trust (b).
//
// trustsReceived[b]++; and trustsPlaced[a]++;: After extracting the trust relationship, we update the trust counts accordingly:
//
// trustsReceived[b]++: We increment the trust count for person b by 1. This indicates that person b has received trust from another person.
// trustsPlaced[a]++: We increment the trust count for person a by 1. This indicates that person a has placed trust in another person.
// These operations are performed for each trust relationship in the trust list. After this loop completes,
// the trustsReceived list contains the count of trusts each person has received,
// and the trustsPlaced list contains the count of trusts each person has placed. These counts will be used later to identify the town judge.