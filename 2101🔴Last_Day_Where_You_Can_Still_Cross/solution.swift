class Solution {
    private func dfs(
        _ i: Int,
        _ j: Int,
        _ days: Int,
        _ dryDays: [[Int]],
        _ notVisited: inout [[Bool]]
    ) -> Bool {
        guard notVisited[i][j] && days <= dryDays[i][j] else { return false }
        guard i < dryDays.count - 1 else { return true }
        notVisited[i][j] = false
        if dfs(i + 1, j, days, dryDays, &notVisited) { return true }
        if j < dryDays[0].count - 1 && dfs(i, j + 1, days, dryDays, &notVisited) { return true }
        if j > .zero && dfs(i, j - 1, days, dryDays, &notVisited) { return true }
        if i > .zero && dfs(i - 1, j, days, dryDays, &notVisited) { return true }
        return false
    }

    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        let maxDays = row * col
        var dryDays = Array(repeating: Array(repeating: maxDays, count: col), count: row)
        for i in 0..<maxDays {
            dryDays[cells[i][0] - 1][cells[i][1] - 1] = i
        }
        var l = 0
        var r = maxDays
        while l < r {
            let c = (l + r + 1) / 2
            var notVisited = Array(repeating: Array(repeating: true, count: col), count: row)
            var reachable = false
            for j in 0..<col {
                reachable = dfs(0, j, c, dryDays, &notVisited)
                if reachable {
                    break
                }
            }
            if reachable {
                l = c
            } else {
                r = c - 1
            }
        }
        return l
    }
}
