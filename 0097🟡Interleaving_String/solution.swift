class Solution {
    private func dp(
        _ fromFirst: Bool,
        _ i1: Int,
        _ s1: [Character],
        _ i2: Int,
        _ s2: [Character],
        _ i3: Int,
        _ s3: [Character],
        _ memo1: inout [Set<Int>],
        _ memo2: inout [Set<Int>]
    ) -> Bool {
        guard i3 < s3.count else { return true }
        if fromFirst {
            guard !memo1[i3].contains(i1) else { return false }
            memo1[i3].insert(i1)
            var i1 = i1
            var i3 = i3
            while i1 < s1.count && s1[i1] == s3[i3] {
                i1 += 1
                i3 += 1
                if dp(false, i1, s1, i2, s2, i3, s3, &memo1, &memo2) {
                    return true
                }
            }
        } else {
            guard !memo2[i3].contains(i2) else { return false }
            memo2[i3].insert(i2)
            var i2 = i2
            var i3 = i3
            while i2 < s2.count && s2[i2] == s3[i3] {
                i2 += 1
                i3 += 1
                if dp(true, i1, s1, i2, s2, i3, s3, &memo1, &memo2) {
                    return true
                }
            }
        }
        return false
    }

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        var memo1 = Array(repeating: Set<Int>(), count: s3.count)
        var memo2 = Array(repeating: Set<Int>(), count: s3.count)
        return dp(true, .zero, s1, .zero, s2, .zero, s3, &memo1, &memo2) || dp(false, .zero, s1, .zero, s2, .zero, s3, &memo1, &memo2)
    }
}
