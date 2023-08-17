class Solution {
    private func dfs(_ curDist: Int, _ i: Int, _ j: Int, _ dists: inout [[Int]]) {
        guard i >= .zero && i < dists.count &&
              j >= .zero && j < dists[0].count &&
              dists[i][j] > curDist else {
            return
        }

        dists[i][j] = curDist

        let newDist = curDist + 1
        dfs(newDist, i + 1, j, &dists)
        dfs(newDist, i - 1, j, &dists)
        dfs(newDist, i, j + 1, &dists)
        dfs(newDist, i, j - 1, &dists)
    }

    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var dists = Array(repeating: Array(repeating: Int.max, count: mat[0].count), count: mat.count)
        for i in 0 ..< mat.count {
            for j in 0 ..< mat[0].count where mat[i][j] == .zero {
                dists[i][j] = 1
            }
        }
        for i in 0 ..< mat.count {
            for j in 0 ..< mat[0].count where mat[i][j] == .zero {
                dfs(.zero, i, j, &dists)
            }
        }
        return dists
    }
}

