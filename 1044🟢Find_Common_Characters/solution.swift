class Solution {
    func commonChars(_ words: [String]) -> [String] {
        guard words.count > 1 else { return Array(words[0].map(String.init)) }

        var counts = [Character: Int]()
        for ch in words[0] {
            counts[ch, default: .zero] += 1
        }

        for i in 1 ..< words.count {
            var newCounts = [Character: Int]()
            for ch in words[i] {
                if let count = counts[ch], count > .zero {
                    newCounts[ch, default: .zero] += 1
                    counts[ch] = count - 1
                }
            }
            counts = newCounts
        }

        var result = [String]()
        for (ch, count) in counts {
            result += Array(repeating: String(ch), count: count)
        }
        return result
    }
}

