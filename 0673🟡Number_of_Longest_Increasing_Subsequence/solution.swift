class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 1 }
        var lengths = Array(repeating: 1, count: nums.count)
        var counts = Array(repeating: 1, count: nums.count)
        var maxLength = 1
        for i in 1..<nums.count {
            for j in 0..<i where nums[i] > nums[j] {
                if lengths[j] + 1 > lengths[i] {
                    lengths[i] = lengths[j] + 1
                    counts[i] = counts[j]
                    maxLength = max(maxLength, lengths[i])
                } else if lengths[j] + 1 == lengths[i] {
                    counts[i] += counts[j]
                }
            }
        }
        return zip(lengths, counts).reduce(0) { (partialResult, element) in
            if element.0 == maxLength {
                return partialResult + element.1
            }
            return partialResult
        }
    }
}
