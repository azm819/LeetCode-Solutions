class Solution {
    func minimumReplacement(_ nums: [Int]) -> Int {
        var minNum: Int = .max
        var result = 0
        var ind = nums.count - 1
        while ind >= .zero {
            if nums[ind] > minNum {
                let count = (nums[ind] + minNum - 1) / minNum
                result += count - 1
                minNum = nums[ind] / count
            } else {
                minNum = nums[ind]
            }
            ind -= 1
        }
        return result
    }
}
