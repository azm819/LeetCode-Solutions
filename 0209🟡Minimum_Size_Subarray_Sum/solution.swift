class Solution {
    private static func hasSubArray(_ sums: [Int], _ length: Int, _ target: Int) -> Bool {
        var ind = length
        while ind < sums.count {
            if sums[ind] - sums[ind - length] >= target {
                return true
            }
            ind += 1
        }
        return false
    }

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
            if Solution.hasSubArray(sums, c, target) {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}
