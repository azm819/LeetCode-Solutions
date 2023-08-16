class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard k < nums.count else { return [nums.max()!] }

        var queue = [Int]()
        for i in 0 ..< k {
            while let last = queue.last, nums[last] < nums[i] {
                queue.removeLast()
            }
            queue.append(i)
        }

        var result = [nums[queue.first!]]

        var availableIndex = 0
        for i in k ..< nums.count {
            if queue[availableIndex] == i - k {
                availableIndex += 1
            }
            while queue.count > availableIndex, let last = queue.last, nums[last] < nums[i] {
                queue.removeLast()
            }
            queue.append(i)
            result.append(nums[queue[availableIndex]])
        }
        queue.removeAll()

        return result
    }
}
