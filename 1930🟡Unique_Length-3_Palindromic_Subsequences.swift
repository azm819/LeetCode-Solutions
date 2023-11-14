class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        var firstPos = [Character: String.Index]()
        var lastPos = [Character: String.Index]()
        var index = s.startIndex
        while index != s.endIndex {
            let ch = s[index]
            if firstPos[ch] == nil {
                firstPos[ch] = index
            }
            lastPos[ch] = index
            index = s.index(after: index)
        }

        var result = 0
        for ch in firstPos.keys {
            if let first = firstPos[ch], let last = lastPos[ch], first != last {
                var between = Set<Character>()
                var index = s.index(after: first)
                while index != last {
                    between.insert(s[index])
                    index = s.index(after: index)
                }
                result += between.count
            }
        }
        return result
    }
}
