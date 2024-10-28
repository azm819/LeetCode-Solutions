class Solution {
    func longestSquareStreak(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var result: Int = -1
        for var num in numSet {
            for i in 1 ... 4 {
                num *= num
                if numSet.contains(num) {
                    result = max(result, i)
                } else {
                    break
                }
            }
        }

        return result < 1 ? -1 : result + 1
    }
}

