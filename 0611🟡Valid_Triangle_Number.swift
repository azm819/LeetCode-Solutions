class Solution {
    private func findThird(_ nums: [Int], _ sum: Int, _ left: Int) -> Int {
        var l = left
        var r = nums.count - 1
        while l < r {
            let c = (l + r + 1) / 2
            if nums[c] < sum {
                l = c
            } else {
                r = c - 1
            }
        }
        return nums[l] < sum ? l - left + 1 : 0
    }

    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return .zero }
        let nums = nums.sorted()
        var res = 0
        for i in 0..<nums.count - 2 {
            for j in i + 1..<nums.count - 1 {
                res += findThird(nums, nums[i] + nums[j], j + 1)
            }
        }
        return res
    }
}

