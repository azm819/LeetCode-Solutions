class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var old = Set<Int>()
        while n != 1 {
            var res = 0
            old.insert(n)
            while n > 0 {
                let digit = n % 10
                res += digit * digit
                n /= 10
            }
            if old.contains(res) {
                return false
            }
            n = res
        }
        return true
    }
}
