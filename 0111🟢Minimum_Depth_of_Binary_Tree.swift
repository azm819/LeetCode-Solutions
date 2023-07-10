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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return .zero }
        var queue = [root]
        var depth = 1
        while true {
            var newQueue = [TreeNode]()
            for node in queue {
                var isLeaf = true
                if let left = node.left {
                    newQueue.append(left)
                    isLeaf = false
                }
                if let right = node.right {
                    newQueue.append(right)
                    isLeaf = false
                }
                if isLeaf { return depth }
            }
            queue = newQueue
            depth += 1
        }
        return depth
    }
}
