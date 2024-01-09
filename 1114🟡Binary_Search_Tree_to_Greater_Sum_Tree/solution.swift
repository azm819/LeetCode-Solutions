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
    @discardableResult
    private func bstToGst(_ root: TreeNode?, _ additional: Int) -> Int {
        guard let root = root else { return .zero }
        root.val += bstToGst(root.right, additional)
        defer {
            root.val += additional
        }
        return root.val + bstToGst(root.left, root.val + additional)
    }

    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        bstToGst(root, .zero)
        return root
    }
}
