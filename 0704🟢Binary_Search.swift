class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            if nums[c] == target {
                return c
            } else if nums[c] < target {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        return -1
    }
}
