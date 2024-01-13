class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        var counts = [Character: Int]()
        for ch in t {
            counts[ch, default: .zero] += 1
        }

        var result = 0
        for ch in s {
            let count = counts[ch, default: .zero]
            if count > .zero {
                counts[ch] = count - 1
            } else {
                result += 1
            }
        }
        return result
    }
}
