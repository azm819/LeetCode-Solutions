class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        var mL = 0
        var l = 0
        var r = 0
        var counts = [Int: Int]()
        var result = 0
        while r < nums.count {
            counts[nums[r], default: .zero] += 1

            while counts.count > k {
                let lCount = counts[nums[l]]!
                if lCount == 1 {
                    counts[nums[l]] = nil
                } else {
                    counts[nums[l]] = lCount - 1
                }
                l += 1
                mL = l
            }

            if counts.count == k {
                while l < r && counts[nums[l]]! > 1 {
                    counts[nums[l]]! -= 1
                    l += 1
                }
                result += l - mL + 1
            }

            r += 1
        }
        return result
    }
}
