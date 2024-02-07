class Solution {
    func frequencySort(_ s: String) -> String {
        var counts = [Character: Int]()
        for ch in s {
            counts[ch, default: .zero] += 1
        }
        var result = ""
        for (ch, count) in counts.sorted(by: { $0.value > $1.value }) {
            for _ in 1 ... count {
                result.append(ch)
            }
        }
        return result
    }
}

