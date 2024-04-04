var runningSum = function(nums) {
    var count = 0
    var list = []
    for (i of nums) {
        count+=i
        list.push(count)
    } return list;
}