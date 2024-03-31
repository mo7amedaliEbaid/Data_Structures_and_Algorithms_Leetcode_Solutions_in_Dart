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

/*class Solution {
  int maxBottlesDrunk(int numBottles, int numExchange) {
    int emptyBottles = 0; // Explicitly initialize variables
    int bottlesDrunk = 0;
    int currentExchange = numExchange;

    while (emptyBottles >= currentExchange) {
      // Drink all remaining full bottles
      bottlesDrunk += numBottles;
      emptyBottles += numBottles;

      // Exchange empty bottles and update exchange rate
      emptyBottles -= currentExchange;
      bottlesDrunk += 1;
      currentExchange += 1;
    }

    // Drink any remaining full bottles after exchanges are done
    bottlesDrunk += numBottles;

    return bottlesDrunk;
  }
}

void main() {
  // Sample test case
  int numBottles = 13;
  int numExchange = 6;
  int maxDrinks = Solution().maxBottlesDrunk(numBottles, numExchange);
  print(maxDrinks); // Output: 15
}*/




class Solution {
  int maxBottlesDrunk(int numBottles, int numExchange) {
    int emptyBottles = 0;
    int bottlesDrunk = 0;

    while (numBottles > 0 || emptyBottles >= numExchange) {
      // Drink one bottle if available
      if (numBottles > 0) {
        bottlesDrunk += 1;
        emptyBottles += 1;
        numBottles -= 1;
      }

      // Exchange empty bottles one by one until not enough or no more full bottles
      while (emptyBottles >= numExchange && numBottles > 0) {
        emptyBottles -= numExchange;
        bottlesDrunk += 1;
        numExchange += 1;
      }
    }

    return bottlesDrunk + numBottles; // Drink remaining bottles after exchanges
  }
}

void main() {
  // Test case: numBottles = 10, numExchange = 3 (Expected output: 13)
  int numBottles = 10;
  int numExchange = 3;
  int maxDrinks = Solution().maxBottlesDrunk(numBottles, numExchange);
  print(maxDrinks); // Output: 13
}



/*class Solution {
  int maxBottlesDrunk(int numBottles, int numExchange) {
    int emptyBottles = 0;
    int bottlesDrunk = 0;

    while (numBottles > 0 || emptyBottles >= numExchange) {
      // Drink one bottle if available
      if (numBottles > 0) {
        bottlesDrunk += 1;
        emptyBottles += 1;
        numBottles -= 1;
      }

      // Exchange empty bottles one by one until not enough
      while (emptyBottles >= numExchange) {
        emptyBottles -= numExchange;
        bottlesDrunk += 1;
        numExchange += 1;
      }
    }

    return bottlesDrunk;
  }
}

void main() {
  // Sample test case
  int numBottles = 10;
  int numExchange = 3;
  int maxDrinks = Solution().maxBottlesDrunk(numBottles, numExchange);
  print(maxDrinks); // Output: 15
}*/
