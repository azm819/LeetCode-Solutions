class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let maxNum = nums.max()!
        var indeces = [Int]()
        for i in 0 ..< nums.count where nums[i] == maxNum {
            indeces.append(i)
        }
        guard indeces.count >= k else { return .zero }
        var result = 0
        for i in 0 ..< indeces.count - k + 1 {
            result += (indeces[i] - (i > 0 ? indeces[i - 1] : -1)) *
                (nums.count - indeces[i + k - 1])
        }
        return result
    }
}
