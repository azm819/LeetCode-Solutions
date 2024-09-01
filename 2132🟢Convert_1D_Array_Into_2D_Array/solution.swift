class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard m * n == original.count else { return [] }

        var result = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0 ..< m {
            for j in 0 ..< n {
                result[i][j] = original[i * n + j]
            }
        }

        return result
    }
}
