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
    func flatten(_ root: TreeNode?, _ tail: TreeNode? = nil) {
        guard let root = root else { return }
        if root.right != nil {
            if root.left != nil {
                flatten(root.left, root.right)
                flatten(root.right, tail)
                root.right = root.left
                root.left = nil
            } else {
                flatten(root.right, tail)
            }
        } else {
            if root.left != nil {
                flatten(root.left, tail)
                root.right = root.left
                root.left = nil
            } else {
                root.right = tail
            }
        }
    }
}
