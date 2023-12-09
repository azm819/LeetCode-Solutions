class Solution {
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var l = 0
        var r = 0
        var counts = [Int: Int]()
        var result = 1
        while r < nums.count {
            counts[nums[r], default: .zero] += 1
            while counts[nums[r]]! > k {
                counts[nums[l]]! -= 1
                l += 1
            }
            r += 1
            result = max(result, r - l)
        }
        return result
    }
}
