class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var l = 1
        var r = nums.count
        while l <= r {
            let c = (l + r) / 2
            let ind = nums.count - c
            if nums[ind] >= c {
                if ind == 0 || nums[ind - 1] < c {
                    return c
                } else {
                    l = c + 1
                }
            } else {
                r = c - 1
            }
        }
        return -1
    }
}
