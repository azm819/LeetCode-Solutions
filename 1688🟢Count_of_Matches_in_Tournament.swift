class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        var n = n
        var result = 0
        while n > 1 {
            result += n % 2
            n /= 2
            result += n
        }
        return result
    }
}
