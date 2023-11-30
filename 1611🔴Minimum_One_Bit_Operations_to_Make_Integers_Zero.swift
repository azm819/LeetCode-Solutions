class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var result = 0
        var k = 0
        var mask = 1

        while mask <= n {
            if n & mask != .zero {
                result = 1 << (k + 1) - 1 - result
            }

            mask *= 2
            k += 1
        }
        
        return result
    }
}
