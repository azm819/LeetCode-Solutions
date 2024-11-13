class Solution {
    private func leftBinSearch(_ nums: [Int], l: Int, r: Int, target: Int) -> Int? {
        guard nums[r] >= target else {
            return nil
        }

        var l = l
        var r = r
        while l < r {
            let m = (l + r) / 2
            if nums[m] < target {
                l = m + 1
            } else {
                r = m
            }
        }

        return l
    }

    private func rightBinSearch(_ nums: [Int], l: Int, r: Int, target: Int) -> Int? {
        guard nums[l] <= target else {
            return nil
        }

        var l = l
        var r = r
        while l < r {
            let m = (l + r + 1) / 2
            if nums[m] > target {
                r = m - 1
            } else {
                l = m
            }
        }

        return l
    }

    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        guard nums.count > 2 else { return .zero }

        let nums = nums.sorted()
        var result = 0
        for i in 1 ..< nums.count {
            if let l = leftBinSearch(nums, l: .zero, r: i - 1, target: lower - nums[i]),
               let r = rightBinSearch(nums, l: .zero, r: i - 1, target: upper - nums[i]),
               l <= r {
                result += r - l + 1
            }
        }

        return result
    }
}
