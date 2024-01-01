class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var r = 0
        var count = k
        while r < nums.count && count > .zero {
            if nums[r] == .zero {
                count -= 1
            }
            r += 1
        }
        var result = r
        var l = -1
        while r < nums.count {
            if nums[r] == .zero {
                l += 1
                while nums[l] != .zero {
                    l += 1
                }
            }
            result = max(result, r - l)
            r += 1
        }
        return result
    }
}

