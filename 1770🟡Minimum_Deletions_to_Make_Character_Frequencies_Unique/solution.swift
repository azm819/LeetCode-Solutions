class Solution {
    func minDeletions(_ s: String) -> Int {
        var charToCounts = [Character: Int]()
        for ch in s {
            charToCounts[ch, default: .zero] += 1
        }
        var counts = Set<Int>()
        var result = 0
        for var count in charToCounts.values {
            while count > .zero && !counts.insert(count).inserted {
                result += 1
                count -= 1
            }
        }
        return result
    }
}
