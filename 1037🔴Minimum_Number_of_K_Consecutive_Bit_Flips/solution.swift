class Solution {
    func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
        var flipped = Set<Int>()
        var windowFlips = 0
        var result = 0
        for i in 0 ..< nums.count {
            if flipped.contains(i - k) {
                windowFlips -= 1
            }

            if windowFlips % 2 == nums[i] {
                if nums.count - i < k {
                    return -1
                }

                windowFlips += 1
                result += 1
                flipped.insert(i)
            }
        }

        return result
    }
}

