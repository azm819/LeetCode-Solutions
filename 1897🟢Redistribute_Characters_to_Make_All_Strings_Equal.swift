class Solution {
    func makeEqual(_ words: [String]) -> Bool {
        var charCounts = [Character: Int]()
        for word in words {
            for char in word {
                charCounts[char, default: .zero] += 1
            }
        }
        return charCounts.allSatisfy { $0.value % words.count == .zero }
    }
}

