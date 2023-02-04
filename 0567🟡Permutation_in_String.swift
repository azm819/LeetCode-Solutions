class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s2.count >= s1.count else { return false }
        let set1 = s1.reduce(into: [:]) { partialResult, ch in
            partialResult[ch] = partialResult[ch, default: .zero] + 1
        }
        var ind2 = s2.startIndex
        var set2 = [Character: Int]()
        for _ in 0..<s1.count {
            set2[s2[ind2]] = set2[s2[ind2], default: .zero] + 1
            ind2 = s2.index(after: ind2)
        }
        var ind1 = s2.startIndex
        while ind2 < s2.endIndex {
            if set1 == set2 {
                return true
            }
            let first = set2[s2[ind1]]!
            if first == 1 {
                set2[s2[ind1]] = nil
            } else {
                set2[s2[ind1]] = first - 1
            }
            set2[s2[ind2]] = set2[s2[ind2], default: .zero] + 1
            ind1 = s2.index(after: ind1)
            ind2 = s2.index(after: ind2)
        }
        return set1 == set2
    }
}
