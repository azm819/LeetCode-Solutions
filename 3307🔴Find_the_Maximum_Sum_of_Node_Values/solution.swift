class Solution {
    func maximumValueSum(_ nums: [Int], _ k: Int, _: [[Int]]) -> Int {
        var minPositiveDiff: Int = .max
        var maxNegativeDiff: Int = .min
        var changedSum: Int = .zero
        var increasedNumCount: Int = .zero
        for num in nums {
            let changedNum = num ^ k
            let diff = changedNum - num

            if diff > .zero {
                increasedNumCount += 1
                minPositiveDiff = min(minPositiveDiff, diff)
                changedSum += changedNum
            } else {
                maxNegativeDiff = max(maxNegativeDiff, diff)
                changedSum += num
            }
        }

        if increasedNumCount % 2 == .zero {
            return changedSum
        } else {
            return max(changedSum - minPositiveDiff, changedSum + maxNegativeDiff)
        }
    }
}
