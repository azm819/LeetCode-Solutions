class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var n = n
        var prod = 1
        var sum = 0
        while n > 0 {
            let dig = n % 10
            prod *= dig
            sum += dig
            n /= 10
        }
        return prod - sum
    }
}
