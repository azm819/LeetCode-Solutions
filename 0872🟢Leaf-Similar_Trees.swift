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
    private func findLeaves(_ root: TreeNode) -> [Int] {
        if root.left == nil && root.right == nil {
            return [root.val]
        }
        var result = [Int]()
        if let left = root.left {
            result = findLeaves(left)
        }
        if let right = root.right {
            result += findLeaves(right)
        }
        return result
    }

    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1 = root1, let root2 = root2 else {
            return root1 == nil && root2 == nil
        }
        return findLeaves(root1) == findLeaves(root2)
    }
}
