class Solution {
    private func cars(_ repr: Int, _ seats: Int) -> Int {
        if repr % seats > .zero {
            return repr / seats + 1
        }
        return repr / seats
    }

    @discardableResult
    private func dfs(_ cur: Int, _ from: Int, _ edges: [Int: Set<Int>], _ seats: Int, _ result: inout Int) -> Int {
        guard let children = edges[cur] else {
            if cur != .zero {
                result += 1
            }
            return 1
        }
        var repr = 1
        for child in children where child != from {
            repr += dfs(child, cur, edges, seats, &result)
        }
        if cur != .zero {
            result += cars(repr, seats)
        }
        return repr
    }

    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        var edges = [Int: Set<Int>]()
        for road in roads {
            let first = road[0]
            let second = road[1]

            var set = edges[first, default: .init()]
            set.insert(second)
            edges[first] = set

            set = edges[second, default: .init()]
            set.insert(first)
            edges[second] = set
        }
        var result = 0
        dfs(.zero, .zero, edges, seats, &result)
        return result
    }
}
