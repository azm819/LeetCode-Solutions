class Solution {
    private var res = [1, 2]

    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        guard n > 2 else { return 2 }
        var cur = 3
        var a = 1
        var b = 2
        while cur < n {
            let c = b
            b += a
            a = c
            cur += 1
        }
        return a + b
    }
}
