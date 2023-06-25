class Solution {
    private func dfs(
        _ locations: [(Int, Int)],
        _ current: Int,
        _ finish: Int,
        _ fuel: Int,
        _ memo: inout [[Int: Int]]
    ) -> Int {
        if let mem = memo[current][fuel] {
            return mem
        }
        var result = locations[current].1 == finish ? 1 : 0

        var ind = current - 1
        while ind >= 0 && locations[current].0 - locations[ind].0 <= fuel {
            result += dfs(locations, ind, finish, fuel - locations[current].0 + locations[ind].0, &memo)
            result %= 1_000_000_007
            ind -= 1
        }
        ind = current + 1
        while ind < locations.count && locations[ind].0 - locations[current].0 <= fuel {
            result += dfs(locations, ind, finish, fuel - locations[ind].0 + locations[current].0, &memo)
            result %= 1_000_000_007
            ind += 1
        }

        memo[current][fuel] = result
        return result
    }

    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        guard abs(locations[start] - locations[finish]) <= fuel else { return .zero }
        var memo = Array(repeating: [Int: Int](), count: locations.count)
        let locations = locations
            .enumerated()
            .map { ($0.element, $0.offset) }
            .sorted { $0.0 < $1.0 }
        let startInd = locations.firstIndex { $0.1 == start }!
        return dfs(locations, startInd, finish, fuel, &memo)
    }
}

