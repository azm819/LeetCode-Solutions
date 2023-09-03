class Solution {
    private func dp(
        _ cur: Int,
        _ jumps: [Int],
        _ memo: inout Set<Int>
    ) -> Bool {
        guard cur < jumps.count else {
            return false
        }
        guard cur != jumps.count - 1 else {
            return true
        }
        guard jumps[cur] > .zero else {
            return false
        }
        if memo.contains(cur) {
            return false
        }
        memo.insert(cur)
        for jump in 1 ... jumps[cur] {
            if dp(cur + jump, jumps, &memo) {
                return true
            }
        }
        return false
    }

    func canJump(_ nums: [Int]) -> Bool {
        var memo = Set<Int>()
        return dp(.zero, nums, &memo)
    }
}

