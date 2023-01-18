/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    private func lca(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
        if root.val < p.val {
            return lca(root.right!, p, q)
        } else if root.val > q.val {
            return lca(root.left!, p, q)
        } else {
            return root
        }
    }

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        if p.val < q.val {
            return lca(root, p, q)
        } else {
            return lca(root, q, p)
        }
    }
}
