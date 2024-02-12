class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var candidate = -1_000_000_001
        for num in nums {
            if count == .zero {
                candidate = num
            }
            if num == candidate {
                count += 1
            } else {
                count -= 1
            }
        }
        return candidate
    }
}

