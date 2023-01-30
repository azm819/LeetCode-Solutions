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
    private func height(_ node: TreeNode?) -> (Bool, Int) {
        guard let node = node else { return (true, 0) }
        let (leftB, leftH) = height(node.left)
        if !leftB {
            return (false, .zero)
        }
        let (rightB, rightH) = height(node.right)
        if !rightB {
            return (false, .zero)
        }
        return (abs(leftH - rightH) < 2, max(leftH, rightH) + 1)
    }

    func isBalanced(_ node: TreeNode?) -> Bool {
        guard let node = node else { return true }
        let (leftB, leftH) = height(node.left)
        if !leftB {
            return false
        }
        let (rightB, rightH) = height(node.right)
        if !rightB {
            return false
        }
        return abs(leftH - rightH) < 2
    }
}
