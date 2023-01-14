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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard var root = root else { return [] }
        var queue = [root]
        var result = [Int]()
        while let last = queue.last {
            if let left = last.left {
                queue.append(left)
                last.left = nil
            } else {
                result.append(last.val)
                queue.popLast()
                if let right = last.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
}
