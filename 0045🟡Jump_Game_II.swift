class Solution {
    func jump(_ nums: [Int]) -> Int {
        var res = 0
        var cur = 0
        var end = 0
        for i in 0..<nums.count - 1 {
            cur = max(cur, i + nums[i])
            if i == end {
                res += 1
                end = cur
            }
        }
        return res
    }
}
