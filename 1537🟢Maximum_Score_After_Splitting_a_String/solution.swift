class Solution {
    func maxScore(_ s: String) -> Int {
        let s = Array(s)
        var score = 0
        for ch in s where ch == "1" {
            score += 1
        }
        var result = 0
        for i in 0 ..< s.count - 1 {
            if s[i] == "0" {
                score += 1
            } else {
                score -= 1
            }
            result = max(result, score)
        }
        return result
    }
}

