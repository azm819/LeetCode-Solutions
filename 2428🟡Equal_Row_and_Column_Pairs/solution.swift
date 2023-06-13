class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        var counts = [[Int]: Int]()
        for row in grid {
            counts[row, default: .zero] += 1
        }

        var result = 0
        for i in 0..<grid.count {
            let column = grid.map { $0[i] }
            if let count = counts[column] {
                result += count
            }
        }
        return result
    }
}
