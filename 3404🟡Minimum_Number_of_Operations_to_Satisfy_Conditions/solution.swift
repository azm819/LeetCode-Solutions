class Solution {
    private func dp(_ curInd: Int, _ prev: Int, _ grid: [[Int]], _ memo: inout [[Int: Int]]) -> Int {
        guard curInd < grid[0].count else {
            return .zero
        }

        if let mem = memo[curInd][prev] {
            return mem
        }

        var result: Int = .max
        for value in 0 ... 10 where value != prev {
            var subRes = 0
            for i in 0 ..< grid.count where grid[i][curInd] != value {
                subRes += 1
            }
            subRes += dp(curInd + 1, value, grid, &memo)
            result = min(result, subRes)
        }
        memo[curInd][prev] = result

        return result
    }

    func minimumOperations(_ grid: [[Int]]) -> Int {
        var memo = Array(repeating: [Int: Int](), count: grid[0].count)
        return dp(.zero, -1, grid, &memo)
    }
}
