class Solution:
    def maxBottlesDrunk(self, numBottles: int, numExchange: int) -> int:
        res = 0
        while True:
            if numBottles >= numExchange:
                res += numExchange
                numBottles -= numExchange - 1
                numExchange += 1
            else:
                res += numBottles
                break
        return res
