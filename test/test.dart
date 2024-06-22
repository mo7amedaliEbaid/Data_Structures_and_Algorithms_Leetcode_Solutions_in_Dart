//Given a string s of '(' , ')' and lowercase English characters.
//
// Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions )
// so that the resulting parentheses string is valid and return any valid string.
//
// Formally, a parentheses string is valid if and only if:
//
// It is the empty string, contains only lowercase characters, or
// It can be written as AB (A concatenated with B), where A and B are valid strings, or
// It can be written as (A), where A is a valid string.
//
//
// Example 1:
//
// Input: s = "lee(t(c)o)de)"
// Output: "lee(t(c)o)de"
// Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
// Example 2:
//
// Input: s = "a)b(c)d"
// Output: "ab(c)d"
// Example 3:
//
// Input: s = "))(("
// Output: ""
// Explanation: An empty string is also valid.

main(){
  String s="a)b(c)d";
  print(validateString(s));
}
String validateString(String s){
  List<int> stack=[];
  List<int> toRemove=[];
  for(var i=0; i< s.length;i++){
    if(s[i] =='('){
     stack.add(i);
    }else if(s[i] ==')'){
      if(stack.isNotEmpty){
        stack.removeLast();
      }else{
        toRemove.add(i);
      }
    }
  }
  toRemove.addAll(stack);
   StringBuffer stringBuffer=StringBuffer();
   for(var i=0;i<s.length;i++){
     if(!toRemove.contains(i)){
       stringBuffer.write(s[i]);

     }
   }
   return stringBuffer.toString();

}