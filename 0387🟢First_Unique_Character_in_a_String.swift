class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var count = [Character: Int]()
        for ch in s {
            count[ch, default: .zero] += 1
        }
        return s
            .enumerated()
            .first { count[$0.element] == 1 }?
            .offset ?? -1
    }
}
