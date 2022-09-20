class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var f = 0
        var s = nums.endIndex - 1
        while f <= s {
            while f != nums.endIndex && nums[f] != val {
                f += 1
            }
            while s >= 0 && nums[s] == val {
                s -= 1
            }
            if f < s && f != nums.endIndex && s >= 0 {
                let a = nums[f]
                nums[f] = nums[s]
                nums[s] = a
            }
        }
        return f
    }
}
