class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var map = [Character: Int]()
        for ch in s {
            map[ch, default: .zero] += 1
        }
        for ch in t {
            if let cnt = map[ch], cnt > .zero {
                map[ch] = cnt - 1
            } else {
                return false
            }
        }
        return map.values.allSatisfy { $0 == .zero }
    }
}

