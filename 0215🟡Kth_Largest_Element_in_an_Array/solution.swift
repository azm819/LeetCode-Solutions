class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var k = k
        while true {
            let mid = nums[nums.count / 2]
            var midCount = 0
            var left = [Int]()
            var right = [Int]()
            for num in nums {
                if num == mid {
                    midCount += 1
                } else if num > mid {
                    left.append(num)
                } else {
                    right.append(num)
                }
            }

            if left.count >= k {
                nums = left
            } else if left.count + midCount >= k {
                return mid
            } else {
                nums = right
                k -= left.count + midCount
            }
        }
    }
}
