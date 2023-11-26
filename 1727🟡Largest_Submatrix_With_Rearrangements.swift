class Solution {
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        var result = 0

        var prevHeights = [(col: Int, height: Int)]()
        for i in 0 ..< matrix.count {
            var newHeights = [(col: Int, height: Int)]()
            var visited = Set<Int>()
            for prev in prevHeights where matrix[i][prev.col] == 1 {
                visited.insert(prev.col)
                newHeights.append((prev.col, prev.height + 1))
            }
            for j in 0 ..< matrix[0].count where matrix[i][j] == 1 && !visited.contains(j) {
                newHeights.append((j, 1))
            }

            for j in 0 ..< newHeights.count {
                result = max(result, newHeights[j].height * (j + 1))
            }

            prevHeights = newHeights
        }

        return result
    }
}
