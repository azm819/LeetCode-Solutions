class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var levelIndices = [Int: (beg: Int, end: Int)]()
        var curLevel = 0
        levelIndices[curLevel] = (-1, -1)
        for i in 0 ..< nums.count {
            if nums[i] == 1 {
                curLevel += 1
            } else {
                curLevel -= 1
            }
            levelIndices[curLevel] = (levelIndices[curLevel]?.beg ?? i, i)
        }

        var result = 0
        for (_, indices) in levelIndices where indices.beg != indices.end {
            result = max(result, indices.end - indices.beg)
        }
        return result
    }
}
