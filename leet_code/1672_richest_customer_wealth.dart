// You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has.
//
// A customer's wealth is the amount of money they have in all their bank accounts. The richest customer is the customer that has the maximum wealth.
//
//
//
// Example 1:
//
// Input: accounts = [[1,2,3],[3,2,1]]
// Output: 6
// Explanation:
// 1st customer has wealth = 1 + 2 + 3 = 6
// 2nd customer has wealth = 3 + 2 + 1 = 6
// Both customers are considered the richest with a wealth of 6 each, so return 6.

/*class Solution {
  int maximumWealth(List<List<int>> accounts) {
    List<int> sums = [];
    for (var i = 0; i < accounts.length; i++) {
      int sum = 0;
      accounts[i].forEach((element) {
        sum += element;
      });
      sums.add(sum);
    }
    int maxNumber =
        sums.reduce((value, element) => value > element ? value : element);
    int minNumber =
        sums.reduce((value, element) => value > element ? element : value);
    print(minNumber);
    return maxNumber;
  }
}

main() {
  print(Solution().maximumWealth([
    [1, 2, 5],
    [3, 2, 7],
    [3, 0, 7],
  ]));
}*/
class Solution {
  int maximumWealth(List<List<int>> accounts) {
    int maxWealth = 0;

    for (List<int> customerAccounts in accounts) {
      int wealth = customerAccounts.reduce((sum, account) => sum + account);
      if (wealth > maxWealth) {
        maxWealth = wealth;
      }
    }

    return maxWealth;
  }
}

void main() {
  Solution solution = Solution();

  // Test case
  print(solution.maximumWealth([[1, 2, 3], [3, 2, 11]])); // Output: 6
}