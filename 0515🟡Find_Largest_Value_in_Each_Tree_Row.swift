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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var queue = [root]
        var result = [Int]()
        while !queue.isEmpty {
            var maxValue: Int = .min
            var newQueue = [TreeNode]()
            for node in queue {
                maxValue = max(maxValue, node.val)
                if let left = node.left {
                    newQueue.append(left)
                }
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            result.append(maxValue)
            queue = newQueue
        }
        return result
    }
}
