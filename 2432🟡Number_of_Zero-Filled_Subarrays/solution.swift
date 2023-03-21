class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var result = 0
        var curRes = 0
        for num in nums {
            if num == 0 {
                curRes += 1
            } else {
                curRes = 0
            }
            result += curRes
        }
        return result
    }
}
