class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var map = [Character: Int]()
        for i in s {
            map[i] = (map[i] ?? .zero) + 1
        }
        var result = 0
        var hasnotMid = true
        for i in map {
            result += i.value / 2 * 2
            if hasnotMid && i.value % 2 == 1 {
                result += 1
                hasnotMid = false
            }
        }
        return result
    }
}
