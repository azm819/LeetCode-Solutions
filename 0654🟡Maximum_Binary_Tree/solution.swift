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
    private func construct(_ l: Int, _ r: Int, _ nums: [Int]) -> TreeNode? {
        guard l <= r else {
            return nil
        }

        var maxInd = l
        for i in l ... r where nums[maxInd] < nums[i] {
            maxInd = i
        }

        return TreeNode(
            nums[maxInd],
            construct(l, maxInd - 1, nums),
            construct(maxInd + 1, r, nums)
        )
    }

    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        construct(.zero, nums.count - 1, nums)
    }
}
