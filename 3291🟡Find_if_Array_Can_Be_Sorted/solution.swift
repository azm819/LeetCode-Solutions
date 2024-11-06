class Solution {
    private static var cache: [Int: Int] = [.zero: .zero]

    private func getSetBitsCount(_ num: Int) -> Int {
        if let cached = Solution.cache[num] {
            return cached
        }

        let result = num % 2 + getSetBitsCount(num / 2)
        Solution.cache[num] = result
        return result
    }

    func canSortArray(_ nums: [Int]) -> Bool {
        var prevSetBitsCount: Int?
        var prevMax: Int = .min
        var currentMax: Int = .min
        for num in nums {
            let setBitsCount = getSetBitsCount(num)
            if prevSetBitsCount == setBitsCount {
                currentMax = max(currentMax, num)
            } else {
                prevSetBitsCount = setBitsCount
                prevMax = currentMax
                currentMax = num
            }


            if num < prevMax {
                return false
            }
        }

        return true
    }
}
