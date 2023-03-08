class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let maxPile = piles.max()!
        var l = max(1, maxPile / h)
        var r = maxPile * piles.count
        while l < r {
            let c = (l + r) / 2
            var hc = 0
            for pile in piles {
                hc += pile / c
                if pile % c > .zero {
                    hc += 1
                }
                if hc > h {
                    break
                }
            }
            if hc > h {
                l = c + 1
            } else {
                r = c
            }
        }
        return r
    }
}
