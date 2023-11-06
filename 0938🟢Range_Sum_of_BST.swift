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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return .zero }
        var queue = [root]
        var result = 0
        while let node = queue.popLast() {
            if node.val >= low && node.val <= high {
                result += node.val
            }
            if node.val >= low, let left = node.left {
                queue.append(left)
            }
            if node.val <= high, let right = node.right {
                queue.append(right)
            }
        }
        return result
    }
}
