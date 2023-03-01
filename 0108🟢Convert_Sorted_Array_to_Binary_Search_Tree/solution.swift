/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    private func sortedArrayToBST(_ nums: [Int], _ from: Int, _ to: Int) -> TreeNode? {
        guard from != to else {
            return TreeNode(nums[from])
        }
        guard from + 1 != to else {
            return TreeNode(nums[from], nil, TreeNode(nums[to]))
        }
        let c = (from + to) / 2
        return TreeNode(nums[c], sortedArrayToBST(nums, from, c - 1), sortedArrayToBST(nums, c + 1, to))
    }

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        sortedArrayToBST(nums, .zero, nums.count - 1)
    }
}
