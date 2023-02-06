class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        let mid = nums.count / 2
        var res = [Int]()
        for i in 0..<mid {
            res.append(nums[i])
            res.append(nums[mid + i])
        }
        return res
    }
}
