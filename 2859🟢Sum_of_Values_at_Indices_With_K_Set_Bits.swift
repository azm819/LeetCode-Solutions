class Solution {
    func sumIndicesWithKSetBits(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        for i in 0 ..< nums.count {
            var ind = i
            var k = k
            while k > 0 && ind > 0 {
                while ind % 2 == 0 {
                    ind /= 2
                }
                ind /= 2
                k -= 1
            }
            if k == 0 && ind == 0 {
                result += nums[i]
            }
        }
        return result
    }
}
