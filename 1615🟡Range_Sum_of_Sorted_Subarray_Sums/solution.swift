class Solution {
    private static let mod: UInt64 = 1_000_000_007

    private func calcCountAndSum(_ nums: [UInt64], _ upperBound: UInt64) -> (count: Int, sum: UInt64) {
        var currentSum: UInt64 = 0
        var windowsSum: UInt64 = 0
        var totalSum: UInt64 = 0
        var count = 0
        var l = 0
        for r in 0 ..< nums.count {
            currentSum += nums[r]
            windowsSum += nums[r] * UInt64(r - l + 1)

            while currentSum > upperBound {
                windowsSum -= currentSum
                currentSum -= nums[l]
                l += 1
            }

            totalSum += windowsSum
            count += r - l + 1
        }

        return (count, totalSum)
    }

    private func calcSums(for firstCount: Int, _ nums: [UInt64], _ minNum: UInt64, _ numsSum: UInt64) -> UInt64 {
        var l = minNum
        var r = numsSum
        while l < r {
            let m = l + (r - l) / 2
            let (count, _) = calcCountAndSum(nums, m)
            if count < firstCount {
                l = m + 1
            } else {
                r = m
            }
        }

        let (count, sum) = calcCountAndSum(nums, l)
        return sum - l * UInt64(count - firstCount)
    }

    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        let nums = nums.map(UInt64.init)
        var minNum: UInt64 = .max
        var numsSum: UInt64 = .zero
        for num in nums {
            minNum = min(minNum, num)
            numsSum += num
        }

        return Int((calcSums(for: right, nums, minNum, numsSum) - calcSums(for: left - 1, nums, minNum, numsSum)) % Solution.mod)
    }
}
