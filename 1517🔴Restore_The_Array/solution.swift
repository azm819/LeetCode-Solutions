class Solution {
    private func dp(_ ind: Int, _ nums: [Int], _ k: Int, _ memo: inout [Int?]) -> Int {
        guard ind < nums.count else {
            return 1
        }
        guard nums[ind] != .zero else {
            return .zero
        }
        if let mem = memo[ind] {
            return mem
        }
        var res = 0
        var i = ind
        var curNum = 0
        while true {
            if i >= nums.count {
                break
            }
            curNum = curNum * 10 + nums[i]
            if curNum > k {
                break
            }
            i += 1
            res = (res + dp(i, nums, k, &memo)) % 1_000_000_007
        }
        memo[ind] = res
        return res
    }

    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        var memo = Array(repeating: Optional<Int>.none, count: s.count)
        let nums = s.map(\.wholeNumberValue!)
        return dp(.zero, nums, k, &memo)
    }
}
