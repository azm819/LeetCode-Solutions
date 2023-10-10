class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let diff = nums.count - 1
        let nums = Set(nums).sorted()
        var result = diff
        for i in 0 ..< nums.count {
            let start = nums[i]
            let end = start + diff
            var l = i
            var r = nums.count - 1
            while l < r {
                let c = (l + r + 1) / 2
                if nums[c] == end {
                    r = c
                    break
                } else if nums[c] > end {
                    r = c - 1
                } else {
                    l = c
                }
            }
            result = min(result, diff - (r - i))
        }
        return result
    }
}
