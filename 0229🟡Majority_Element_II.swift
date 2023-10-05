class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var counts = [Int: Int]()
        for num in nums {
            counts[num, default: .zero] += 1
        }
        return counts.compactMap {
            $0.value > nums.count / 3 ? $0.key : nil
        }
    }
}
