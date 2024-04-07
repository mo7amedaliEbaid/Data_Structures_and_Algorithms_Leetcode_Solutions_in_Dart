class Solution {
  public String getSmallestString(String s, int k) {
    StringBuilder nm=new StringBuilder();
    for(int i=0;i<s.length();i++)
    {
      char c=s.charAt(i);
      int val=Math.min(123-c, c-97);
      if(k>0)
      {
        if(val<=k)
        {
          nm.append("a");
          k-=val;
        }
        else
        {
          c=(char)(c-k);
          nm.append(c);
          k-=val;
        }
      }
      else
      {
        nm.append(c);
      }
    }
    return nm.toString();
  }
}