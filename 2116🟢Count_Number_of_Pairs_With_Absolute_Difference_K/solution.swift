class Solution {
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = .zero

        var counts = [Int: Int]()
        for num in nums {
            result += counts[num + k] ?? .zero
            result += counts[num - k] ?? .zero
            counts[num, default: .zero] += 1
        }

        return result
    }
}

