// O(n^2) - Quadratic Time Complexity - Examples
void quadraticTimeExample(List<int> numbers) {
  for (int i = 0; i < numbers.length; i++) {
    for (int j = 0; j < numbers.length; j++) {
      print('${numbers[i]} * ${numbers[j]} = ${numbers[i] * numbers[j]}');
    }
  }
}

// Generating All Possible Pairs from a List

// O(n^2) - Quadratic Time Complexity
List<List<int>> generatePairs(List<int> numbers) {
  List<List<int>> pairs = [];
  for (int i = 0; i < numbers.length; i++) {
    for (int j = 0; j < numbers.length; j++) {
      pairs.add([numbers[i], numbers[j]]); // Generating pairs
    }
  }
  return pairs;
}
//In this function, nested loops iterate over each element in the list numbers to generate all possible pairs of elements.
// As the size of the list increases, the number of iterations required grows quadratically, resulting in quadratic time complexity.
