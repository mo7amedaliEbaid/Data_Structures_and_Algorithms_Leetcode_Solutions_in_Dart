class Solution {
  public int[] runningSum(int[] nums) {
    int[] p=new int[nums.length];
    p[0]=nums[0];
    for(int i=1;i<nums.length;i++){
      p[i]=p[i-1]+nums[i];
    }
    return p;
  }
}