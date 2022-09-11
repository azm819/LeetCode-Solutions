class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            let val = nums[c]
            if val == target {
                return true
            } else {
                let lVal = nums[l]
                if lVal < val {
                    if lVal <= target && val > target {
                        r = c - 1
                    } else {
                        l = c + 1
                    }
                } else if lVal > val {
                    if nums[r] >= target && val < target {
                        l = c + 1
                    } else {
                        r = c - 1
                    }
                } else {
                    l += 1
                }
            }
        }
        return false
    }
}
