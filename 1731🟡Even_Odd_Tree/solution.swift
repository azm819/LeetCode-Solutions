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
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var currentLevel = [root]
        var isEven = true
        while !currentLevel.isEmpty {
            var nextLevel = [TreeNode]()
            var prev: Int = isEven ? .min : .max
            for node in currentLevel {
                if isEven {
                    if prev >= node.val || node.val % 2 == 0 { return false }
                } else {
                    if prev <= node.val || node.val % 2 == 1 { return false }
                }
                prev = node.val
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            currentLevel = nextLevel
            isEven.toggle()
        }
        return true
    }
}
