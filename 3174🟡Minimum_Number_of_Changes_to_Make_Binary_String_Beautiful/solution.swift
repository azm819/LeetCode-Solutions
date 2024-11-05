class Solution {
    func minChanges(_ s: String) -> Int {
        var result = 0
        var ind = s.startIndex
        while ind != s.endIndex {
            let l = ind
            let r = s.index(after: l)
            if s[l] != s[r] {
                result += 1
            }
            ind = s.index(after: r)
        }

        return result
    }
}

