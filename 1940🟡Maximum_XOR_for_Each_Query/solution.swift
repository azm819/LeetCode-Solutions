class Solution {
    func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
        let maxMask = 1 << maximumBit - 1
        var currentMask: Int = .zero
        return nums.map { num in
            currentMask ^= num
            return currentMask ^ maxMask
        }.reversed()
    }
}

