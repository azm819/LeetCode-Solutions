class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var ranks = Array(repeating: 0, count: n)
        var neighbours = [Int: Set<Int>]()
        for road in roads {
            ranks[road[0]] += 1
            ranks[road[1]] += 1
            neighbours[road[0], default: Set()].insert(road[1])
        }
        var result = 0
        for i in 0 ..< ranks.count - 1 {
            for j in i + 1 ..< ranks.count {
                var subRes = ranks[i] + ranks[j]
                if neighbours[i]?.contains(j) ?? false ||
                   neighbours[j]?.contains(i) ?? false {
                    subRes -= 1
                }
                result = max(result, subRes)
            }
        }

        return result
    }
}
