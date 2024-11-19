class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var l = 0
        var r = 0
        var curSum = 0
        var counts = [Int: Int]()
        while r < k {
            curSum += nums[r]
            counts[nums[r], default: .zero] += 1
            r += 1
        }

        var result = 0
        if counts.count == k {
            result = max(result, curSum)
        }

        while r < nums.count {
            counts[nums[r], default: .zero] += 1
            curSum += nums[r]
            r += 1

            let prevCount = counts[nums[l]]!
            counts[nums[l]] = prevCount == 1 ? nil : prevCount - 1
            curSum -= nums[l]
            l += 1

            if counts.count == k {
                result = max(result, curSum)
            }
        }

        return result
    }
}
