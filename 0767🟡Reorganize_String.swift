class Solution {
    func reorganizeString(_ s: String) -> String {
        var counts = [Character: Int]()
        var maxCount = 0
        for ch in s {
            counts[ch, default: .zero] += 1
            maxCount = max(maxCount, counts[ch]!)
        }
        guard maxCount <= (s.count + 1) / 2 else { return "" }
        var result = Array(repeating: Character(" "), count: s.count)
        var index = 0
        for (ch, count) in counts.sorted(by: { $0.value > $1.value }) {
            for _ in 1 ... count {
                result[index] = ch
                index += 2
                if index >= s.count {
                    index = 1
                }
            }
        }
        return String(result)
    }
}

