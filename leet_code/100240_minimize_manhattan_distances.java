class Solution {
  public int minimumDistance(int[][] points) {
    int n = points.length;
    int[][] co = new int[n][];
    for(int i = 0;i < n;i++){
      co[i] = new int[]{points[i][0]+points[i][1], points[i][0]-points[i][1], i};
    }
    List<int[]> all = new ArrayList<>();
    Arrays.sort(co, (x, y) -> {
      if (x[0] != y[0]) return x[0] - y[0];
      return (x[1] - y[1]);
    });
    all.add(co[0]);
    all.add(co[1]);
    all.add(co[2]);
    all.add(co[n-1]);
    all.add(co[n-2]);
    all.add(co[n-3]);
    Arrays.sort(co, (x, y) -> {
      if (x[1] != y[1]) return x[1] - y[1];
      return (x[0] - y[0]);
    });
    all.add(co[0]);
    all.add(co[1]);
    all.add(co[2]);
    all.add(co[n-1]);
    all.add(co[n-2]);
    all.add(co[n-3]);

    long ans = Long.MAX_VALUE;
    for(int i = 0;i < all.size();i++){
      int id = all.get(i)[2];
      long max = Long.MIN_VALUE;
      for(int j = 0;j < all.size();j++){
        for(int k = j+1;k < all.size();k++){
          int[] a = all.get(j);
          int[] b = all.get(k);
          if(a[2] == id || b[2] == id)continue;
          long d = Math.max(Math.abs(a[0]-b[0]), Math.abs(a[1]-b[1]));
          max = Math.max(max, d);
        }
      }
      ans = Math.min(ans, max);
    }
    return (int)ans;
  }
}
