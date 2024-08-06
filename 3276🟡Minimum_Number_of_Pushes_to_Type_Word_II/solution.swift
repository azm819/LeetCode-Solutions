class Solution {
    func minimumPushes(_ word: String) -> Int {
        var counts = [Character: Int]()
        for ch in word {
            counts[ch, default: .zero] += 1
        }

        let sortedCounts = counts.sorted { $0.value > $1.value }

        var result = 0
        var pushesNumber = 1
        var buttons = 8
        for (_, count) in sortedCounts {
            result += count * pushesNumber
            buttons -= 1
            if buttons == .zero {
                buttons = 8
                pushesNumber += 1
            }
        }

        return result
    }
}

