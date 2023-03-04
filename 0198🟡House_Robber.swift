class Solution {
    func rob(_ nums: [Int]) -> Int {
        var f = 0
        var s = 0
        for num in nums {
            let c = max(f + num, s)
            f = s
            s = c
        }
        return s
    }
}
