class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var num = 1
        var k = k - 1
        while k > .zero {
            var from = num
            var to = num + 1
            var steps = 0
            while from <= n {
                steps += min(n + 1, to) - from
                from *= 10
                to *= 10
            }

            if steps <= k {
                num += 1
                k -= steps
            } else {
                num *= 10
                k -= 1
            }
        }

        return num
    }
}

