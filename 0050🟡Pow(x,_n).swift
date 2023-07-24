class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard x != .zero else { return 0 }
        guard n != .zero else { return 1 }
        var x = n < .zero ? 1 / x : x
        var n = abs(n)
        var result: Double = 1
        while n != .zero {
            if n % 2 == 1 {
                result *= x
            }
            n /= 2
            x *= x
        }
        return result
    }
}
