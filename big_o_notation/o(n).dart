// O(n) - Linear Time Complexity - Examples

void linearTimeExample(List<int> numbers) {
  for (int number in numbers) {
    print(number);
  }
}
// Finding Maximum Element in a List
int findMax(List<int> numbers) {
  int max = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > max) {
      max = numbers[i];
    }
  }
  return max;
}

// Checking if a List Contains a Specific Element

bool containsElement(List<int> numbers, int target) {
  for (int number in numbers) {
    if (number == target) {
      return true;
    }
  }
  return false;
}

// Finding the Sum of All Elements in a List


// O(n) - Linear Time Complexity
int sumOfElements(List<int> numbers) {
  int sum = 0;
  for (int number in numbers) {
    sum += number; // Iterating through each element
  }
  return sum;
}
//In this function, each element in the list numbers is iterated over once,
// and its value is added to the sum. As the size of the list increases, the time taken to compute the sum grows linearly.

// Searching for an Element in a List


// O(n) - Linear Time Complexity
bool linearSearch(List<int> numbers, int target) {
  for (int number in numbers) {
    if (number == target) {
      return true; // Element found
    }
  }
  return false; // Element not found
}
// In this function, each element in the list numbers is compared to the target value.
// The function returns true if the element is found, and false otherwise.
// As the size of the list increases, the number of iterations required for the search grows linearly.

