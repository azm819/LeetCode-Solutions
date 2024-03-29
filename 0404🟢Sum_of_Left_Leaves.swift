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
    func sumOfLeftLeaves(_ root: TreeNode?, _ isLeft: Bool = false) -> Int {
        guard let root = root else { return .zero }
        if root.left == nil && root.right == nil {
            return isLeft ? root.val : .zero
        }
        return sumOfLeftLeaves(root.left, true) + sumOfLeftLeaves(root.right, false)
    }
}
