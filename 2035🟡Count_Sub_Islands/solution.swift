class Solution {
    private func removePotential(_ i: Int, _ j: Int, _ grid2: [[Int]], _ isPotentialSub: inout [[Bool?]]) {
        guard i >= .zero && i < grid2.count && j >= .zero && j < grid2[i].count && grid2[i][j] == 1 && isPotentialSub[i][j] != false else {
            return
        }

        isPotentialSub[i][j] = false

        removePotential(i + 1, j, grid2, &isPotentialSub)
        removePotential(i - 1, j, grid2, &isPotentialSub)
        removePotential(i, j + 1, grid2, &isPotentialSub)
        removePotential(i, j - 1, grid2, &isPotentialSub)
    }

    private func dfs(
        _ i: Int,
        _ j: Int,
        _ grid1: [[Int]],
        _ grid2: [[Int]],
        _ isPotentialSub: inout [[Bool?]]
    ) -> Bool {
        guard i >= .zero && i < grid2.count && j >= .zero && j < grid2[i].count && grid2[i][j] == 1 && isPotentialSub[i][j] == nil else {
            return true
        }

        guard grid1[i][j] == 1 else {
            removePotential(i, j, grid2, &isPotentialSub)
            return false
        }

        isPotentialSub[i][j] = true

        return dfs(i + 1, j, grid1, grid2, &isPotentialSub) &&
            dfs(i - 1, j, grid1, grid2, &isPotentialSub) &&
            dfs(i, j + 1, grid1, grid2, &isPotentialSub) &&
            dfs(i, j - 1, grid1, grid2, &isPotentialSub)
    }

    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var isPotentialSub = Array(repeating: Array(repeating: Bool?.none, count: grid1[0].count), count: grid1.count)

        var result = 0
        for i in 0 ..< grid2.count {
            for j in 0 ..< grid2[i].count where grid2[i][j] == 1 &&
                isPotentialSub[i][j] == nil &&
                dfs(i, j, grid1, grid2, &isPotentialSub) {
                result += 1
            }
        }

        return result
    }
}
