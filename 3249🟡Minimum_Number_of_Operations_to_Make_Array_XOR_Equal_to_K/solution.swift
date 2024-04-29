class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var xoredNum = 0
        for num in nums {
            xoredNum ^= num
        }
        xoredNum ^= k

        var result = 0
        while xoredNum > 0 {
            result += xoredNum % 2
            xoredNum /= 2
        }
        return result
    }
}

