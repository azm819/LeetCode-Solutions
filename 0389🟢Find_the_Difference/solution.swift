class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var map = [Character: Int]()
        for ch in s {
            map[ch, default: .zero] += 1
        }
        for ch in t {
            if let cnt = map[ch] {
                if cnt > 1 {
                    map[ch] = cnt - 1
                } else {
                    map[ch] = nil
                }
            } else {
                return ch
            }
        }
        return map.keys.first!
    }
}
