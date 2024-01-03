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
    func goodNodes(_ root: TreeNode?, _ maxVal: Int = -10_000) -> Int {
        guard let root = root else { return .zero }
        let newMaxVal = max(maxVal, root.val)
        return (root.val < maxVal ? 0 : 1) + goodNodes(root.left, newMaxVal) + goodNodes(root.right, newMaxVal)
    }
}
