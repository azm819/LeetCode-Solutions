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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var levelElements = [[Int]]()
        var queue = [root]
        while !queue.isEmpty {
            var newQueue = [TreeNode]()
            var newLevel = [Int]()
            while let node = queue.popLast() {
                newLevel.append(node.val)
                if let left = node.left {
                    newQueue.append(left)
                }
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            levelElements.append(newLevel)
            queue = newQueue
        }
        return levelElements.map { level in
            let sum = level.reduce(.zero, +)
            return Double(sum) / Double(level.count)
        }
    }
}
