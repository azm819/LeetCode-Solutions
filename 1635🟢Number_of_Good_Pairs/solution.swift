class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var counts = Array(repeating: 0, count: 101)
        for num in nums {
            counts[num] += 1
        }

        return counts.reduce(0) { partialResult, count in
            return partialResult + count * (count - 1) / 2
        }
    }
}
