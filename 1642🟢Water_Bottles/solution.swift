class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var numBottles = numBottles
        var result = numBottles
        while numBottles >= numExchange {
            let exchanged = numBottles / numExchange
            result += exchanged
            numBottles = (numBottles % numExchange) + exchanged
        }
        return result
    }
}
