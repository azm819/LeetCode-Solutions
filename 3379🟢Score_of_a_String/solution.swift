class Solution {
    func scoreOfString(_ s: String) -> Int {
        var result = 0
        var firstInd = s.startIndex
        var secondInd = s.index(after: firstInd)
        while secondInd != s.endIndex {
            result += abs(Int(s[firstInd].asciiValue!) - Int(s[secondInd].asciiValue!))
            firstInd = s.index(after: firstInd)
            secondInd = s.index(after: secondInd)
        }
        return result
    }
}

