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
    func tree2str(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        var result = "\(root.val)"
        if let left = root.left {
            result += "(\(tree2str(left)))"
        } else if root.right != nil {
            result += "()"
        }
        if let right = root.right {
            result += "(\(tree2str(right)))"
        }
        return result
    }
}
