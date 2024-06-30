class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var index = nums.count - 1
        var indexToSwap: Int?
        while index > .zero {
            if nums[index] > nums[index - 1] {
                indexToSwap = index - 1
                break
            }
            index -= 1
        }

        var l: Int
        if let indexToSwap1 = indexToSwap {
            var indexToSwap2 = indexToSwap1 + 1
            for index in indexToSwap1 + 1 ..< nums.count where nums[index] > nums[indexToSwap1] && nums[indexToSwap2] >= nums[index] {
                indexToSwap2 = index
            }
            nums.swapAt(indexToSwap1, indexToSwap2)
            l = indexToSwap1 + 1
        } else {
            l = 0
        }

        var r = nums.count - 1
        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}
