class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var counts = [Character: Int]()
        for ch in s {
            counts[ch, default: .zero] += 1
        }
        var result = [Character]()
        var chSet = Set<Character>()
        for ch in s {
            counts[ch]! -= 1
            if chSet.contains(ch) { continue }
            while let last = result.last, last > ch, counts[last]! != .zero {
                result.removeLast()
                chSet.remove(last)
            }
            result.append(ch)
            chSet.insert(ch)
        }
        return String(result)
    }
}
