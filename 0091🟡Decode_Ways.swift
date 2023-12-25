class Solution {
    private func numDecodings(
        _ ind: String.Index,
        _ s: String,
        _ memo: inout [String.Index: Int]
    ) -> Int {
        guard ind != s.endIndex else { return 1 }
        if let mem = memo[ind] { return mem }
        var result = 0
        var curInd = ind
        var curNum = 0
        while curInd != s.endIndex {
            curNum = curNum * 10 + s[curInd].wholeNumberValue!
            curInd = s.index(after: curInd)
            if 1 ... 26 ~= curNum {
                result += numDecodings(curInd, s, &memo)
            } else {
                break
            }
        }
        memo[ind] = result
        return result
    }

    func numDecodings(_ s: String) -> Int {
        var memo = [String.Index: Int]()
        return numDecodings(s.startIndex, s, &memo)
    }
}

