class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        let sum = nums.reduce(0, +)

        guard sum >= p else {
            return -1
        }

        let expectedRemainder = sum % p
        
        guard expectedRemainder != .zero else {
            return .zero
        }

        var remainderInd = [Int: Int]()
        remainderInd[0] = -1
        var remainder: Int = .zero
        var result: Int = .max
        for i in 0 ..< nums.count {
            remainder = (remainder + nums[i]) % p
            remainderInd[remainder] = i

            if let ind = remainderInd[(p + remainder - expectedRemainder) % p] {
                result = min(result, i - ind)
            }
        }

        return result == .max || result == nums.count ? -1 : result
    }
}
