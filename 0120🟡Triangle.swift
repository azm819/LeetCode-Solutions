class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = triangle.last!
        var ind = triangle.count - 2
        while ind >= .zero {
            for i in 0 ..< triangle[ind].count {
                result[i] = triangle[ind][i] + min(result[i], result[i + 1])
            }
            ind -= 1
        }
        return result.first!
    }
}
