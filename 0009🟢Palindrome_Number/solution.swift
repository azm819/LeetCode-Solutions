class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var a = x
        var b = 0
        while a > 0 {
            b = b * 10 + a % 10
            a /= 10
        }
        return x == b
    }
}
