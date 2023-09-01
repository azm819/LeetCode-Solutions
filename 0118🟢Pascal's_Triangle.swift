class Solution {
    private static var rows = [[1], [1, 1]]

    func generate(_ numRows: Int) -> [[Int]] {
        while numRows > Solution.rows.count {
            var newRow = Array(repeating: 1, count: Solution.rows.last!.count + 1)
            var i = 1
            while i < Solution.rows.last!.count {
                newRow[i] = Solution.rows.last![i - 1] + Solution.rows.last![i]
                i += 1
            }
            Solution.rows.append(newRow)
        }
        return Array(Solution.rows[..<numRows])
    }
}
