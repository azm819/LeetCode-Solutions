class Solution {
    func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
        var l = max(1, quantities.reduce(0, +) / n)
        var r = quantities.max()!
        while l < r {
            let m = (l + r) / 2

            var storesCount = n
            for quantity in quantities {
                storesCount -= (quantity + m - 1) / m
                if storesCount < .zero {
                    break
                }
            }

            if storesCount < .zero {
                l = m + 1
            } else {
                r = m
            }
        }

        return l
    }
}
