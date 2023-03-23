class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int: Int]()
        var stack = [Int]()
        for num in nums2 {
            while stack.last ?? .max < num {
                result[stack.popLast()!] = num
            }
            stack.append(num)
        }
        return nums1.map { result[$0] ?? -1 }
    }
}
