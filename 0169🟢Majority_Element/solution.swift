class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var freqs = [Int: Int]()
        let limit = nums.count / 2
        for num in nums {
            freqs[num, default: .zero] += 1
            if freqs[num]! > limit {
                return num
            }
        }
        fatalError()
    }
}

