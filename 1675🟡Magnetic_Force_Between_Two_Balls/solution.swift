class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        var l = 1
        let positions = position.sorted()
        var r = positions.last! - positions.first!
        while l < r {
            let c = (l + r + 1) / 2
            var last = positions.first!
            var baskets = 1
            for position in positions {
                if position - last >= c {
                    last = position
                    baskets += 1
                }
            }
            if baskets < m {
                r = c - 1
            } else {
                l = c
            }
        }
        return l
    }
}
