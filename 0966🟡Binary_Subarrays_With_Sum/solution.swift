class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var nextOne = Array(repeating: Int?.none, count: nums.count)
        var minOneIndex: Int?
        var curInd = nums.count - 1
        while curInd >= 0 {
            if nums[curInd] == 1 {
                minOneIndex = curInd
            }
            nextOne[curInd] = minOneIndex
            curInd -= 1
        }

        guard minOneIndex != nil || goal == .zero else { return .zero }

        var l = 0
        var r = 0
        var result = 0
        var curSum = nums[0]
        while l < nums.count {
            while curSum < goal && r < nums.count - 1 {
                r += 1
                curSum += nums[r]
            }
            if curSum < goal {
                break
            }

            if curSum == goal {
                result += (min(nextOne[l] ?? r, r)) - l + 1
                while r < nums.count - 1 && nums[r + 1] == 0 {
                    r += 1
                    result += (min(nextOne[l] ?? r, r)) - l + 1
                }
            }

            while l < nums.count && nums[l] == 0 {
                l += 1
            }
            if l == nums.count {
                break
            }
            l += 1
            curSum -= 1
        }
        return result
    }
}
