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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var queue = [root]
        var depth = 0
        while !queue.isEmpty {
            var newQueue = [TreeNode]()
            while let node = queue.popLast() {
                if res.count == depth {
                    res.append(node.val)
                }
                if let right = node.right {
                    newQueue.append(right)
                }
                if let left = node.left {
                    newQueue.append(left)
                }
            }
            queue = newQueue.reversed()
            depth += 1
        }
        return res
    }
}
