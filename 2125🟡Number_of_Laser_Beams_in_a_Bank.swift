class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var lastCount = 0
        var result = 0
        for row in bank {
            var curCount = 0
            for cell in row where cell == "1" {
                curCount += 1
            }
            if curCount != .zero {
                result += lastCount * curCount
                lastCount = curCount
            }
        }
        return result
    }
}

