class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let diffs = zip(s, t).map {
            Int(max($0.0, $0.1).asciiValue! - min($0.0, $0.1).asciiValue!)
        }

        var l = 0
        var r = 0
        var result = 0
        var cost = 0
        while r < diffs.count {
            while r < diffs.count && cost + diffs[r] <= maxCost {
                cost += diffs[r]
                r += 1
                result = max(result, r - l)
            }

            if l < r {
                cost -= diffs[l]
                l += 1
            } else if l == r {
                r += 1
                l = r
            }
        }
        return result
    }
}

