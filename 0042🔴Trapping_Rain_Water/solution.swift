class Solution {
    func trap(_ height: [Int]) -> Int {
        guard var left = height.firstIndex(where: { $0 > .zero }),
              var right = height.lastIndex(where: { $0 > .zero }) else {
            return .zero
        }
        var result = 0
        while left < right {
            let curMax = min(height[left], height[right])
            if height[left] == curMax {
                while left < right && height[left] <= curMax {
                    result += curMax - height[left]
                    left += 1
                }
            }
            if height[right] == curMax {
                while left < right && height[right] <= curMax {
                    result += curMax - height[right]
                    right -= 1
                }
            }
        }
        return result
    }
}
