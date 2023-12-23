class Solution {
    func incremovableSubarrayCount(_ nums: [Int]) -> Int {
        var l = 0
        var result = 0
        while l < nums.count {
            var r = l
            while r < nums.count {
                var isIncremovable = true
                var last: Int = .min
                for i in 0 ..< nums.count where i < l || i > r {
                    if nums[i] <= last {
                        isIncremovable = false
                        break
                    }
                    last = nums[i]
                }
                if isIncremovable {
                    result += nums.count - r
                    break
                }
                r += 1
            }
            l += 1
        }
        return result
    }
}

