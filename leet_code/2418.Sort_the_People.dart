// You are given an array of strings names, and an array heights that consists of distinct positive integers. Both arrays are of length n.

// For each index i, names[i] and heights[i] denote the name and height of the ith person.

//Return names sorted in descending order by the people's heights.

 

//Example 1:

//Input: names = ["Mary","John","Emma"], heights = [180,165,170]
//Output: ["Mary","Emma","John"]
//Explanation: Mary is the tallest, followed by Emma and John.
//Example 2:

//Input: names = ["Alice","Bob","Bob"], heights = [155,185,150]
//Output: ["Bob","Alice","Bob"]
//Explanation: The first Bob is the tallest, followed by Alice and the second Bob.

class Solution {
  List<String> sortPeople(List<String> names, List<int> heights) {
    // Combine the names and heights into a list of tuples
    List<MapEntry<String, int>> people = List.generate(names.length, (i) => MapEntry(names[i], heights[i]));
    
    // Sort the list by heights in descending order
    people.sort((a, b) => b.value.compareTo(a.value));
    
    // Extract the sorted names
    List<String> sortedNames = people.map((e) => e.key).toList();
    
    return sortedNames;
  }
}
