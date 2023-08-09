class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        guard nums.count > 1 else { return .zero }
        let nums = nums.sorted()
        var l = 0
        var r = nums.last! - nums.first!
        while l < r {
            var c = (l + r) / 2
            var ind = 1
            var cnt = p
            while cnt > .zero && ind < nums.count {
                if nums[ind] - nums[ind - 1] <= c {
                    ind += 2
                    cnt -= 1
                } else {
                    ind += 1
                }
            }
            if cnt == .zero {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}
