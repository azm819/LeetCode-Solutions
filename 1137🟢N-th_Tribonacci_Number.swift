class Solution {
    func tribonacci(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 1 else { return 1 }
        guard n > 2 else { return 1 }
        var a = 0
        var b = 1
        var c = 1
        var i = 2
        while i < n {
            let oldC = c
            let oldB = b
            c += a + b
            b = oldC
            a = oldB
            i += 1
        }
        return c
    }
}
