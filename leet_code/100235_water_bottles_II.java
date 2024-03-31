class Solution {
  public int maxBottlesDrunk(int numBottles, int numExchange) {
    int ans = 0;
    int emp = 0;
    while(true){
      if(numBottles + emp < numExchange)break;
      ans += numBottles;
      emp += numBottles;
      numBottles = 0;
      while(emp >= numExchange){
        emp -= numExchange;
        numBottles++;
        numExchange++;
      }
    }
    return ans + numBottles;
  }
}