class Solution {
    func minimumLength(_ s: String) -> Int {
        var l = s.startIndex
        var r = s.index(before: s.endIndex)
        while l < r && s[l] == s[r] {
            let commonCh = s[l]
            l = s.index(after: l)
            r = s.index(before: r)

            while l < s.endIndex && s[l] == commonCh {
                l = s.index(after: l)
            }

            while r >= s.startIndex && s[r] == commonCh {
                if r == s.startIndex {
                    return .zero
                }
                r = s.index(before: r)
            }
        }
        let distance = s.distance(from: l, to: r)
        return distance >= .zero ? distance + 1 : .zero
    }
}
