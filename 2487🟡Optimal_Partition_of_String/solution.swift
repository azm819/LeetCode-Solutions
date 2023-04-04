class Solution {
    func partitionString(_ s: String, _ ind: String.Index? = nil) -> Int {
        guard ind != s.endIndex else { return .zero }
        var index = ind ?? s.startIndex
        var chars = Set<Character>()
        while index != s.endIndex {
            let ch = s[index]
            let (inserted, _) = chars.insert(ch)
            if !inserted {
                chars.removeAll()
                return partitionString(s, index) + 1
            }
            index = s.index(after: index)
        }
        return 1
    }
}
