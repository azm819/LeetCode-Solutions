class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var res = nums
        for i in 1..<res.count {
            res[i] += res[i - 1]
        }
        return res
    }
}
