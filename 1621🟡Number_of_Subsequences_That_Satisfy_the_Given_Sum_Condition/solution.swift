class Solution {
    private var pows = [Int: Int]()

    private func calcPow(_ n: Int) -> Int {
        guard n > .zero else { return 1 }
        if let pow = pows[n] { return pow }
        let res = 2 * calcPow(n - 1)
        pows[n] = res
        return res % 1_000_000_007
    }

    private func search(_ nums: [Int], _ target: Int, _ left: Int) -> Int {
        guard target > .zero else { return .zero }
        var l = left
        var r = nums.count - 1
        while l < r {
            let c = (l + r + 1) / 2
            if nums[c] > target {
                r = c - 1
            } else {
                l = c
            }
        }
        guard nums[l] <= target else { return .zero }
        return calcPow(l - left) % 1_000_000_007
    }

    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 1 else {
            return nums[0] * 2 > target ? .zero : 1
        }
        let nums = nums.sorted()
        var res = 0
        for i in 0..<nums.count {
            res = (res + search(nums, target - nums[i], i)) % 1_000_000_007
        }
        return res
    }
}
