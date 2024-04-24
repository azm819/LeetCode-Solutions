class Solution {
    private static var memo = [0, 1, 1]

    func tribonacci(_ n: Int) -> Int {
        var a = Solution.memo[Solution.memo.count - 3]
        var b = Solution.memo[Solution.memo.count - 2]
        var c = Solution.memo[Solution.memo.count - 1]
        while Solution.memo.count <= n {
            let oldC = c
            let oldB = b
            c += a + b
            b = oldC
            a = oldB
            Solution.memo.append(c)
        }
        return Solution.memo[n]
    }
}
