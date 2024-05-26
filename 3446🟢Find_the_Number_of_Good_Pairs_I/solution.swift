class Solution {
    func numberOfPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var result = 0
        for num1 in nums1 where num1 % k == .zero {
            for num2 in nums2 where num1 % (num2 * k) == .zero {
                result += 1
            }
        }
        return result
    }
}

