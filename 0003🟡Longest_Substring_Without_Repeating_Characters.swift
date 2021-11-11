extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        
        var res = 1
        var l = 0
        var dict: [Character: Int] = .init()
        
        for (i, c) in s.enumerated() {
            if dict.keys.contains(c) {
                l = max(l, dict[c]!)
            }
            dict[c] = i + 1
            res = max(res, i - l + 1)
        }
        return res
    }
}
