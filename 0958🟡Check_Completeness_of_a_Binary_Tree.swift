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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var queue = [root]
        var curLvl = 1
        var nodesLeft = 0
        let lvlToNodes = [1: 1, 2: 2, 3: 4, 4: 8, 5: 16, 6: 32, 7: 64, 8: 128]
        while !queue.isEmpty {
            if nodesLeft > .zero {
                return false
            }
            nodesLeft = lvlToNodes[curLvl]!
            var hasGap = false
            var newQueue = [TreeNode]()
            for node in queue {
                nodesLeft -= 1
                if let left = node.left {
                    if hasGap { return false }
                    newQueue.append(left)
                } else {
                    hasGap = true
                }
                if let right = node.right {
                    if hasGap { return false }
                    newQueue.append(right)
                } else {
                    hasGap = true
                }
            }
            queue = newQueue
            curLvl += 1
        }
        return true
    }
}
