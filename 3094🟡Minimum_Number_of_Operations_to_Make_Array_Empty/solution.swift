class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()
        for num in nums {
            counts[num, default: .zero] += 1
        }

        var result = 0
        for count in counts.values {
            if count == 1 {
                return -1
            }
            result += count / 3
            if count % 3 > 0 {
                result += 1
            }
        }
        return result
    }
}
