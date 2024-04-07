/*"""" You are given a string s and an integer k.

 Define a function distance(s1, s2) between two strings s1 and s2 of the same length n as:

 The sum of the minimum distance between s1[i] and s2[i] when the characters from 'a' to 'z' are placed in a cyclic order, for all i in the range [0, n - 1].
 For example, distance("ab", "cd") == 4, and distance("a", "z") == 1.

 You can change any letter of s to any other lowercase English letter, any number of times.

 Return a string denoting the lexicographically smallest string t you can get after some changes, such that distance(s, t) <= k.



 Example 1:

 Input: s = "zbbz", k = 3

 Output: "aaaz"

 Explanation:

 Change s to "aaaz". The distance between "zbbz" and "aaaz" is equal to k = 3.

 Example 2:

 Input: s = "xaxcd", k = 4

 Output: "aawcd"

 Explanation:

 The distance between "xaxcd" and "aawcd" is equal to k = 4.

 Example 3:

 Input: s = "lol", k = 0

 Output: "lol"

 Explanation:

 It's impossible to change any character as k = 0.



 Constraints:

 1 <= s.length <= 100
 0 <= k <= 2000
 s consists only of lowercase English letters. """"

"""
 Since the task is to return the lexicographically smallest string, so we will try to convert the beginning characters into 'a', if possible.
 """

"""  Approach
 It iterates through each characterchin the input strings.
 For each characterch, it calculates two values:
 • left : The distance between the character and 'a' on left side.
 • right: The distance between the character and 'a' on the right side.
 It then calculatesmnn,which is the minimum ofleftandright.
 Ifk(the remaining operations) is greater than or equal to mnn, it reduceskbymnnand sets the current characterchto 'a'.
 Otherwise, it subtracts k from the current character ch and break the loop.
 Finally, it returns the modified strings.
 Complexity
 Time complexity: O(n) """*/
 class Solution
 {
 public:
     string getSmallestString(string s, int k)
     {
         string ans = s;
         for (char &ch : s)
         {
             int left = ch - 'a';
             int right = 'z' - ch + 1;
             int mnn = min(left, right);
             if (k >= mnn)
             {
                 k -= mnn;
                 ch = 'a';
             }
             else
             {
                 ch = ch - k;
                 break;
             }
         }
         return s;
     }
 };