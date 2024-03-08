class Solution {
    func maxFrequencyElements(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()
        var maxFreaquency = 0
        for num in nums {
            let count = counts[num, default: .zero] + 1
            maxFreaquency = max(maxFreaquency, count)
            counts[num] = count
        }

        var result = 0
        for (_, count) in counts where count == maxFreaquency {
            result += count
        }
        return result
    }
}

