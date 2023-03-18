class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        var ch1: Character?
        var ch2: Character?
        var ind = s1.startIndex
        var swapped = false
        while ind != s1.endIndex {
            if s1[ind] != s2[ind] {
                if swapped {
                    return false
                }
                if ch1 == nil {
                    ch1 = s1[ind]
                    ch2 = s2[ind]
                } else {
                    if ch1 != s2[ind] || ch2 != s1[ind] {
                        return false
                    }
                    swapped.toggle()
                }
            }
            ind = s1.index(after: ind)
        }
        return ch1 == nil || swapped
    }
}
