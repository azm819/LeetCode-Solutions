class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var l = 0
        var r = 0
        var result = 0
        var product = 1
        while r < nums.count {
            product *= nums[r]
            if product < k {
                result += r - l + 1
                r += 1
            } else if nums[r] >= k {
                while r < nums.count && nums[r] >= k {
                    r += 1
                }
                l = r
                product = 1
            } else {
                while l < r {
                    product /= nums[l]
                    l += 1
                    if product < k {
                        product /= nums[r]
                        break
                    }
                }
            }
        }
        return result
    }
}
