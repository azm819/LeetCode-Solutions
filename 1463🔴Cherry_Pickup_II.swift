class Solution {
    private func dp(
        _ row: Int,
        _ first: Int,
        _ second: Int,
        _ grid: [[Int]],
        _ memo: inout [[[Int?]]]
    ) -> Int {
        guard row < grid.count &&
            first >= .zero && first < grid[0].count &&
            second >= .zero && second < grid[0].count else {
            return .zero
        }

        if let mem = memo[row][first][second] {
            return mem
        }

        let curRowResult: Int
        if first == second {
            curRowResult = grid[row][first]
        } else {
            curRowResult = grid[row][first] + grid[row][second]
        }
        var nextResult = 0
        for i in -1 ... 1 {
            for j in -1 ... 1 {
                nextResult = max(
                    nextResult,
                    dp(row + 1, first + i, second + j, grid, &memo)
                )
            }
        }
        memo[row][first][second] = curRowResult + nextResult
        return curRowResult + nextResult
    }

    func cherryPickup(_ grid: [[Int]]) -> Int {
        var memo = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Int?.none,
                    count: grid[0].count
                ),
                count: grid[0].count
            ),
            count: grid.count
        )
        return dp(.zero, .zero, grid[0].count - 1, grid, &memo)
    }
}
