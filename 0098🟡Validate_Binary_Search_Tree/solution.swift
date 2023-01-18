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
    private func isValidBST(_ root: TreeNode?, _ left: Int?, _ right: Int?) -> Bool {
        guard let root = root else { return true }
        if let left = left, root.val <= left {
            return false
        }
        if let right = right, root.val >= right {
            return false
        }
        return isValidBST(root.left, left, root.val) && isValidBST(root.right, root.val, right)
    }

    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, nil, nil)
    }
}
