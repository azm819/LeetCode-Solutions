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
    private func areEqual(_ f: TreeNode?, _ s: TreeNode?) -> Bool {
        guard let f = f, let s = s else { return f == nil && s == nil }
        return f.val == s.val && areEqual(f.left, s.right) && areEqual(f.right, s.left)
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        return areEqual(root?.left, root?.right)
    }
}
