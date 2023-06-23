class Solution {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        var states = Array(repeating: [Int: Int](), count: nums.count)
        var result = 2
        for i in 1..<nums.count {
            for j in 0..<i {
                let diff = nums[i] - nums[j]
                let newCnt = states[j][diff, default: 1] + 1
                states[i][diff] = max(states[i][diff, default: .zero], newCnt)
                result = max(result, newCnt)
            }
        }
        return result
    }
}
