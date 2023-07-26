class Solution {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        guard Int(ceil(hour)) >= dist.count else { return -1 }
        var dists = dist.map(Double.init)
        var l = 1
        var r = 10_000_000

        while l < r {
            let c = Double((l + r) / 2)
            let subRes = dists.reduce(Double.zero) { partialResult, dist in
                ceil(partialResult) + dist / c
            }
            if subRes > hour {
                l = Int(c) + 1
            } else {
                r = Int(c)
            }
        }
        return l
    }
}
