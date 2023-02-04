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
    private func height(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else { return (.zero, .zero) }
        let (leftH, leftD) = height(root.left)
        let (rightH, rightD) = height(root.right)
        return (max(leftH, rightH) + 1, max(max(leftD, rightD), leftH + rightH))
    }

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return .zero }
        let (leftH, leftD) = height(root.left)
        let (rightH, rightD) = height(root.right)
        return max(max(leftD, rightD), leftH + rightH)
    }
}
