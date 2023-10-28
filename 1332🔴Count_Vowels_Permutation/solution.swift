class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        guard n > 1 else { return 5 }

        var counts: [Character: Int] = [
            "a": 1,
            "e": 1,
            "i": 1,
            "o": 1,
            "u": 1,
        ]

        for _ in 2 ... n {
            var newCounts: [Character: Int] = [:]
            newCounts["a"] = (counts["e"]! + counts["i"]! + counts["u"]!) % 1_000_000_007
            newCounts["e"] = (counts["a"]! + counts["i"]!) % 1_000_000_007
            newCounts["i"] = (counts["e"]! + counts["o"]!) % 1_000_000_007
            newCounts["o"] = counts["i"]
            newCounts["u"] = (counts["i"]! + counts["o"]!) % 1_000_000_007
            counts = newCounts
        }

        return counts.values.reduce(0) { partialResult, value in
            (partialResult + value) % 1_000_000_007
        }
    }
}

