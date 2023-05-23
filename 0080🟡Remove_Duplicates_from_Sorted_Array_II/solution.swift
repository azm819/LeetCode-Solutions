class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var oldEl: Int?
        var elCount = 0
        var result = nums.count
        for i in 0..<nums.count {
            if oldEl == nums[i] {
                elCount += 1
                if elCount > 2 {
                    nums[i] = .max
                    result -= 1
                }
            } else {
                oldEl = nums[i]
                elCount = 1
            }
        }
        nums.sort()
        return result
    }
}

