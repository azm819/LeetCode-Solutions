class Solution {
    func minSwaps(_ nums: [Int]) -> Int {
        var onesCount: Int = .zero
        for num in nums where num == 1 {
            onesCount += 1
        }

        guard onesCount > 1 else { return .zero }
        guard onesCount < nums.count else { return .zero }

        var ind = 0
        var curCount = 0
        while ind < onesCount {
            if nums[ind] == 1 {
                curCount += 1
            }

            ind += 1
        }

        ind %= nums.count
        var result = onesCount - curCount
        while ind != onesCount - 1 {
            if nums[(ind - onesCount + nums.count) % nums.count] == 1 {
                curCount -= 1
            }

            if nums[ind] == 1 {
                curCount += 1
            }

            result = min(result, onesCount - curCount)
            ind = (ind + 1) % nums.count
        }

        return result
    }
}
