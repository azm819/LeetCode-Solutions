class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        var monoStack = [Int]()
        for i in 0 ..< nums.count {
            if monoStack.isEmpty || nums[monoStack.last!] > nums[i] {
                monoStack.append(i)
            }
        }

        var result: Int = .zero
        var ind = nums.count - 1
        while ind >= .zero {
            while let last = monoStack.last, nums[last] <= nums[ind] {
                result = max(result, ind - last)
                monoStack.removeLast()
            }
            ind -= 1
        }

        return result
    }
}

