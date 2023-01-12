class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var maps = [Character: Character]()
        var mapt = [Character: Character]()
        var ind = s.startIndex
        while ind < s.endIndex {
            if let c = maps[s[ind]] {
                if c != t[ind] {
                    return false
                }
            } else {
                maps[s[ind]] = t[ind]
            }
            if let c = mapt[t[ind]] {
                if c != s[ind] {
                    return false
                }
            } else {
                mapt[t[ind]] = s[ind]
            }
            ind = s.index(after: ind)
        }
        return true
    }
}
