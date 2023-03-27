class Solution {
    private struct Coord: Hashable {
        let x: Int
        let y: Int
    }

    private var cache = [Coord: Int]()

    func minPathSum(_ grid: [[Int]], _ x: Int = .zero, _ y: Int = .zero) -> Int {
        let coord = Coord(x: x, y: y)
        if let cached = cache[coord] {
            return cached
        }
        let result: Int
        switch (x < grid.count - 1, y < grid[0].count - 1) {
        case (true, true):
            result = grid[x][y] + min(minPathSum(grid, x + 1, y), minPathSum(grid, x, y + 1))
        case (true, false):
            result = grid[x][y] + minPathSum(grid, x + 1, y)
        case (false, true):
            result = grid[x][y] + minPathSum(grid, x, y + 1)
        case (false, false):
            result = grid[x][y]
        }
        cache[coord] = result
        return result
    }
}
