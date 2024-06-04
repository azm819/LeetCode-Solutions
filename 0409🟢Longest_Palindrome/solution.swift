class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var counts = [Character: Int]()
        for ch in s {
            counts[ch, default: .zero] += 1
        }

        var result = 0
        var hasMid = false
        for (_, count) in counts {
            result += count / 2 * 2
            if count % 2 == 1 {
               hasMid = true 
            }
        }
        return hasMid ? result + 1 : result
    }
}
