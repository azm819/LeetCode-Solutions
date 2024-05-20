class Solution {
    func subsetXORSum(_ nums: [Int], _ curInd: Int = .zero, _ curValue: Int = .zero) -> Int {
        guard curInd < nums.count else {
            return curValue
        }

        return subsetXORSum(nums, curInd + 1, curValue) + subsetXORSum(nums, curInd + 1, curValue ^ nums[curInd])
    }
}
