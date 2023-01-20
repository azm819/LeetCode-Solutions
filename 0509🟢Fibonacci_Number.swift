class Solution {
    func fib(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 1 else { return 1 }
        var a = 0
        var b = 1
        for i in 2...n {
            let c = b
            b += a
            a = c
        }
        return b
    }
}
