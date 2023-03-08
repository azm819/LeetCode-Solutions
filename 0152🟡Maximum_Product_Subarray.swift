class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums[0]
        var negRes = 0
        var posRes = 0
        for num in nums {
            if num < 0 {
                let curPos = posRes
                posRes = negRes == 0 ? 0 : negRes * num
                negRes = curPos == 0 ? num : curPos * num
            } else {
                posRes = posRes == 0 ? num : posRes * num
                negRes = negRes == 0 ? 0 : negRes * num
            }
            if posRes != 0 {
                res = max(res, posRes)
            } else {
                res = max(res, num)
            }
        }
        return res
    }
}
