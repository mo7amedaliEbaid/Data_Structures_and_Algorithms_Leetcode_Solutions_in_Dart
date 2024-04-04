// Given an integer n, return a string array answer (1-indexed) where:
//
// answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
// answer[i] == "Fizz" if i is divisible by 3.
// answer[i] == "Buzz" if i is divisible by 5.
// answer[i] == i (as a string) if none of the above conditions are true.
//
//
// Example 1:
//
// Input: n = 3
// Output: ["1","2","Fizz"]
// Example 2:
//
// Input: n = 5
// Output: ["1","2","Fizz","4","Buzz"]
// Example 3:
//
// Input: n = 15
// Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

class Solution {
  List<String> fizzBuzz(int n) {
    List<int> result = generateList(n);
    List<String> outPut = [];
    for (int i = 0; i < n; i++) {
      if (result[i] % 3 == 0 && result[i] % 5 == 0) {
        outPut.add("FizzBuzz");
      }else
      if (result[i] % 3 == 0) {
        outPut.add("Fizz");
      }else
      if (result[i] % 5 == 0) {
        outPut.add("Buzz");
      }
      else {
        outPut.add(result[i].toString());
      }
    }
    return outPut;
  }

  List<int> generateList(int n) {
    List<int> result = [];

    for (int i = 0; i < n; i++) {
      result.add(i + 1);
    }

    return result;
  }
}
main(){
  print(Solution().fizzBuzz(15));
  print(Solution().fizzBuzz(3));
  print(Solution().fizzBuzz(5));
  print(Solution().fizzBuzz(150));
}