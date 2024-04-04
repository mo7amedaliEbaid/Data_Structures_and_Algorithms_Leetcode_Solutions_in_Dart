public IList<string> FizzBuzz(int n) {
        List<string> result = new List<string>(n);
        for(int i=1,fizz=0,buzz=0; i<=n; i++){
            fizz++;
            buzz++;
            if(fizz == 3 && buzz == 5){
                result.Add("FizzBuzz");
                fizz = 0;
                buzz = 0;
            }else if(fizz == 3){
                result.Add("Fizz");
                fizz = 0;
            }else if(buzz == 5){
                result.Add("Buzz");
                buzz = 0;
            }else{
                result.Add(i.ToString());
            }
        }
        return result;
    }