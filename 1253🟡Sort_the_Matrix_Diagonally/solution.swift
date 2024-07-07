class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: mat[0].count), count: mat.count)
        for i in 0 ..< mat.count {
            var array = [Int]()
            var j = 0
            while i + j < mat.count && j < mat[0].count {
                array.append(mat[i + j][j])
                j += 1
            }

            array.sort()
            j = 0
            while i + j < mat.count && j < mat[0].count {
                result[i + j][j] = array[j]
                j += 1
            }
        }

        for j in 1 ..< mat[0].count {
            var array = [Int]()
            var i = 0
            while i < mat.count && j + i < mat[0].count {
                array.append(mat[i][j + i])
                i += 1
            }

            array.sort()
            i = 0
            while i < mat.count && j + i < mat[0].count {
                result[i][j + i] = array[i]
                i += 1
            }
        }

        return result
    }
}
