// You are given two integers numBottles and numExchange.
//
// numBottles represents the number of full water bottles that you initially have. In one operation, you can perform one of the following operations:
//
// Drink any number of full water bottles turning them into empty bottles.
// Exchange numExchange empty bottles with one full water bottle. Then, increase numExchange by one.
// Note that you cannot exchange multiple batches of empty bottles for the same value of numExchange. For example, if numBottles == 3 and numExchange == 1, you cannot exchange 3 empty water bottles for 3 full bottles.
//
// Return the maximum number of water bottles you can drink.
//
//  Input: numBottles = 13, numExchange = 6
// Output: 15
// Explanation: The table above shows the number of full water bottles, empty water bottles,
// the value of numExchange, and the number of bottles drunk.

class Solution {
  int maxBottlesDrunk(int numBottles, int numExchange) {
    int ans = 0;
    int emp = 0;
    while (true) {
      if (numBottles + emp < numExchange) break;
      ans += numBottles;
      emp += numBottles;
      numBottles = 0;
      while (emp >= numExchange) {
        emp -= numExchange;
        numBottles++;
        numExchange++;
      }
    }
    return ans + numBottles;
  }
}

void main() {
  // Test case: numBottles = 10, numExchange = 3 (Expected output: 13)
  int numBottles = 10;
  int numExchange = 3;
  int maxDrinks = Solution().maxBottlesDrunk(numBottles, numExchange);
  print(maxDrinks); // Output: 13
}



