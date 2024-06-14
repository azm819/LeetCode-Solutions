class Solution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()
        var minNum: Int = .max
        var maxNum: Int = .min
        for num in nums {
            minNum = min(minNum, num)
            maxNum = max(maxNum, num)
            counts[num, default: .zero] += 1
        }

        var result = 0
        var toIncrementCount = 0
        for num in minNum ... maxNum {
            toIncrementCount = max(.zero, toIncrementCount + counts[num, default: .zero] - 1)
            result += toIncrementCount
        }

        while toIncrementCount > 1 {
            toIncrementCount -= 1
            result += toIncrementCount
        }

        return result
    }
}

