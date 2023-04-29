class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var sums = Array(repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            sums[i] = sums[i - 1] + nums[i - 1]
        }
        guard sums.last! >= target else {
            return .zero
        }
        var l = 1
        var r = nums.count
        while l < r {
            let c = (l + r) / 2
            var ind = c
            var found = false
            while ind <= nums.count {
                if sums[ind] - sums[ind - c] >= target {
                    found = true
                    break
                }
                ind += 1
            }
            if found {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}

