class Solution {
    private func backtrace(_ ind: Int, _ nums: [Int], _ curOr: Int, _ maxOr: Int) -> Int {
        guard ind < nums.count else {
            return curOr == maxOr ? 1 : 0
        }

        return backtrace(ind + 1, nums, curOr, maxOr) + backtrace(ind + 1, nums, curOr | nums[ind], maxOr)
    }

    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        backtrace(.zero, nums, .zero, nums.reduce(0, |))
    }
}

