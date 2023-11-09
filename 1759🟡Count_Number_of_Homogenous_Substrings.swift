class Solution {
    func countHomogenous(_ s: String) -> Int {
        var result = 0
        var curCount = 0
        var lastChar: Character?
        for char in s {
            if char == lastChar {
                curCount += 1
            } else {
                curCount = 1
                lastChar = char
            }

            result += curCount
            result %= 1_000_000_007
        }

        return result
    }
}

