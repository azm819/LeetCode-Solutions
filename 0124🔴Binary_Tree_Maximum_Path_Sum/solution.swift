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
    private func maxPathSums(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else {
            return (.min, .zero)
        }
        let leftSums = maxPathSums(root.left)
        let rightSums = maxPathSums(root.right)
        let bestEndingSum = max(root.val, root.val + leftSums.1, root.val + rightSums.1)
        return (
            max(bestEndingSum, root.val + leftSums.1 + rightSums.1, leftSums.0, rightSums.0),
            bestEndingSum
        )
    }

    func maxPathSum(_ root: TreeNode?) -> Int {
        maxPathSums(root).0
    }
}
