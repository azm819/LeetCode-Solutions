class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else { return false }
        var inds = s.startIndex
        var indt = t.startIndex
        while inds < s.endIndex {
            while indt < t.endIndex {
                if s[inds] == t[indt] {
                    inds = s.index(after: inds)
                    indt = t.index(after: indt)
                    break
                }
                indt = t.index(after: indt)
            }
            if inds < s.endIndex && indt == t.endIndex {
                return false
            }
        }
        return true
    }
}
