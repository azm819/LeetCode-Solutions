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
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return .zero }

        var queue = [root]
        var resultSum: Int = .min
        var resultLevel: Int = .zero
        var level: Int = .zero
        while !queue.isEmpty {
            var newQueue: [TreeNode] = []
            level += 1
            var levelSum: Int = .zero
            while let node = queue.popLast() {
                levelSum += node.val
                if let left = node.left {
                    newQueue.append(left)
                }
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            if levelSum > resultSum {
                resultSum = levelSum
                resultLevel = level
            }
            queue = newQueue
        }
        
        return resultLevel
    }
}
