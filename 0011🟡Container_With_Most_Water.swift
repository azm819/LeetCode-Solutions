class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0
        var r = height.count - 1
        var result = 0
        while l < r {
            var minHeight = min(height[l], height[r])
            result = max(result, minHeight * (r - l))
            while l < height.count && height[l] <= minHeight {
                l += 1
            }
            while r >= .zero && height[r] <= minHeight {
                r -= 1
            }
        }
        return result
    }
}
