class Solution {
    func minOperations(_ s: String) -> Int {
        var firstOp = 0 // 101010101...
        var secondOp = 0 // 010101010...
        var firstStateOne = true
        for ch in s {
            if ch == "0" {
                if firstStateOne {
                    firstOp += 1
                } else {
                    secondOp += 1
                }
            } else {
                if firstStateOne {
                    secondOp += 1
                } else {
                    firstOp += 1
                }
            }
            firstStateOne.toggle()
        }
        return min(firstOp, secondOp)
    }
}
