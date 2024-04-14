class Solution {
    static let primes = Set([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])

    func maximumPrimeDifference(_ nums: [Int]) -> Int {
        var minI = nums.count - 1
        var maxI = 0
        for i in 0 ..< nums.count where Solution.primes.contains(nums[i]) {
            minI = min(minI, i)
            maxI = max(maxI, i)
        }
        return maxI - minI
    }
}

