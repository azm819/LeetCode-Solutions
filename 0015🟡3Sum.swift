class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        for i in 0 ..< nums.count - 2 where i == .zero || nums[i] != nums[i - 1] {
            var l = i + 1
            var r = nums.count - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if sum == .zero {
                    result.append([nums[i], nums[l], nums[r]])
                    while l < r && nums[i] + nums[l] + nums[r] == .zero {
                        l += 1
                    }
                } else if sum > .zero {
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        return result
    }
}
