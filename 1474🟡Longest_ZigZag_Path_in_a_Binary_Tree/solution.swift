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
    func longestZigZag(_ root: TreeNode?, _ fromLeft: Int = .zero, _ fromRight: Int = .zero) -> Int {
        guard let root = root else { return max(fromLeft, fromRight) - 1 }
        return max(longestZigZag(root.left, .zero, fromLeft + 1), longestZigZag(root.right, fromRight + 1, .zero))
    }
}
