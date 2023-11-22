class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var elements = [(i: Int, indSum: Int, num: Int)]()
        for i in 0 ..< nums.count {
            for j in 0 ..< nums[i].count {
                elements.append((i, i + j, nums[i][j]))
            }
        }
        elements.sort { lhs, rhs in
            lhs.indSum < rhs.indSum ||
            lhs.indSum == rhs.indSum && lhs.i > rhs.i
        }
        return elements.map(\.num)
    }
}
