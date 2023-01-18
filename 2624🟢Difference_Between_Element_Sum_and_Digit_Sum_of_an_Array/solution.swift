class Solution {
    func differenceOfSum(_ nums: [Int]) -> Int {
        var el = 0
        var di = 0
        for i in 0..<nums.count {
            var num = nums[i]
            el += num
            while num > 0 {
                di += num % 10
                num = num / 10
            }
        }
        return abs(el - di)
    }
}
