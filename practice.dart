main() {
  print(Solution().isPalindrome("A man, a plan, a canal: Panama").toString());
}

class Solution {
  bool isPalindrome(String s) {
    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      while (left < right && !isAlphaNumeric(s[left])) left++;
      while (left < right && !isAlphaNumeric(s[right])) right--;

      if (s[left].toLowerCase() != s[right].toLowerCase()) {
        return false;
      } else {
        left++;
        right--;
      }
    }
    return true;
  }

  bool isAlphaNumeric(String char) {
    if (char.length != 1) return false;

    int ascii = char.codeUnitAt(0);
    int zero = "0".codeUnitAt(0);
    int nine = "9".codeUnitAt(0);
    int z = "z".codeUnitAt(0);
    int a = "a".codeUnitAt(0);
    int A = "A".codeUnitAt(0);
    int Z = "Z".codeUnitAt(0);

    return (ascii >= zero && ascii <= nine) ||
        (ascii >= a && ascii <= z) ||
        (ascii >= A && ascii <= Z);
  }
}
