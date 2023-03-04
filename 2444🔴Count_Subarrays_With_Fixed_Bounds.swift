class Solution {
    private func countSubarrays(
        _ nums: [Int],
        _ minK: Int,
        _ maxK: Int,
        _ from: Int,
        _ to: Int
    ) -> Int {
        guard to >= from else { return .zero }
        if from == to { return minK == maxK && nums[from] == minK ? 1 : .zero }
        var result = 0
        var minCount = 0
        var maxCount = 0
        var lastMin = from
        var lastMax = from
        var toI = from
        var lastTo = from
        while toI <= to {
            if nums[toI] == minK {
                minCount += 1
                lastMin = toI
            }
            if nums[toI] == maxK {
                maxCount += 1
                lastMax = toI
            }
            if minCount > .zero && maxCount > .zero {
                let isMin = nums[toI] == minK
                let fromI = isMin ? lastMax : lastMin
                result += (fromI - lastTo + 1) * (to - toI + 1)
                lastTo = fromI + 1
                minCount = isMin ? 1 : .zero
                maxCount = isMin ? .zero : 1
            }
            toI += 1
        }
        return result
    }

    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var result = 0
        var from = 0
        var to = 0
        while to < nums.count {
            if nums[to] <= maxK && nums[to] >= minK {
                to += 1
            } else {
                result += countSubarrays(nums, minK, maxK, from, to - 1)
                to += 1
                from = to
            }
        }
        result += countSubarrays(nums, minK, maxK, from, to - 1)
        return result
    }
}
