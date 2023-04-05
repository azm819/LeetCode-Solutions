class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let enumeratedNums = nums.enumerated()
        var stack = Array(enumeratedNums)
        var result = Array(repeating: -1, count: nums.count)
        for num in enumeratedNums {
            while let last = stack.last, last.element < num.element {
                result[last.offset] = num.element
                stack.popLast()
            }
            stack.append(num)
        }
        return result
    }
}
