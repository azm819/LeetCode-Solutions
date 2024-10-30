class Solution {
    func longestIncreasingSubsequence(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: nums.count)
        var lis = [nums[0]]
        for i in 1 ..< nums.count {
            var l = 0
            var r = lis.count
            while l < r {
                let m = (l + r) / 2
                if lis[m] < nums[i] {
                    l = m + 1
                } else {
                    r = m
                }
            }

            if l == lis.count {
                lis.append(nums[i])
            } else {
                lis[l] = nums[i]
            }
            result[i] = lis.count
        }
        return result
    }

    func minimumMountainRemovals(_ nums: [Int]) -> Int {
        let lis = longestIncreasingSubsequence(nums)
        let lds = longestIncreasingSubsequence(nums.reversed())

        var result = nums.count - 3
        for i in 1 ..< nums.count - 1 where lis[i] > 1 && lds[nums.count - i - 1] > 1 {
            result = min(result, nums.count - (lis[i] + lds[nums.count - i - 1] - 1))
        }

        return result
    }
}
