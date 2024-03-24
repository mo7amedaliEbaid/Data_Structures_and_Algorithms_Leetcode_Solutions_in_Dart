void main() {
  String sentence = "   fly me   to   the moon  ";
  print(lengthOfLastWord(sentence));
  ///  String firstWord = getFirstWord(sentence);
//  print(firstWord); // Output: fly
}

int lengthOfLastWord(String s) {
  // Trim leading and trailing whitespace
  s = s.trim();

  // Split the sentence by whitespace
  List<String> words = s.split(RegExp(r'\s+'));

  // Return the first word
  return words.last.length;
}