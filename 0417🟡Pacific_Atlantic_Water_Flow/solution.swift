class Solution {
    private struct Ocean: OptionSet {
        let rawValue: Int

        static let atlantic = Ocean(rawValue: 1 << 0)
        static let pacific = Ocean(rawValue: 1 << 1)

        static let all: Ocean = [atlantic, pacific]
    }

    private func dfs(_ heights: [[Int]], _ i: Int, _ j: Int, _ lastH: Int, _ lastOcean: Ocean, _ oceans: inout [[Ocean]]) {
        guard i >= .zero && i < heights.count && j >= .zero && j < heights[0].count else {
            return
        }
        guard heights[i][j] >= lastH else {
            return
        }
        let (inserted, newOcean) = oceans[i][j].insert(lastOcean)
        guard inserted else {
            return
        }
        dfs(heights, i + 1, j, heights[i][j], newOcean, &oceans)
        dfs(heights, i - 1, j, heights[i][j], newOcean, &oceans)
        dfs(heights, i, j + 1, heights[i][j], newOcean, &oceans)
        dfs(heights, i, j - 1, heights[i][j], newOcean, &oceans)
    }

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let n = heights.count
        let m = heights[0].count
        var oceans = Array(repeating: Array(repeating: Ocean(), count: m), count: n)
        dfs(heights, 0, m - 1, .zero, .all, &oceans)
        dfs(heights, n - 1, 0, .zero, .all, &oceans)
        for i in 0..<n {
            dfs(heights, i, 0, .zero, .pacific, &oceans)
            dfs(heights, i, m - 1, .zero, .atlantic, &oceans)
        }
        for j in 0..<m {
            dfs(heights, 0, j, .zero, .pacific, &oceans)
            dfs(heights, n - 1, j, .zero, .atlantic, &oceans)
        }
        var result = [[Int]]()
        for i in 0..<n {
            for j in 0..<m {
                if oceans[i][j] == .all {
                    result.append([i, j])
                }
            }
        }
        return result
    }
}
