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
    private func heightAndDiameterOfBinaryTree(_ root: TreeNode?) -> (height: Int, diameter: Int) {
        guard let root = root else { return (height: .zero, diameter: .zero) }
        let left = heightAndDiameterOfBinaryTree(root.left)
        let right = heightAndDiameterOfBinaryTree(root.right)
        return (
            height: max(left.height, right.height) + 1,
            diameter: max(max(left.diameter, right.diameter), left.height + right.height)
        )
    }

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        heightAndDiameterOfBinaryTree(root).diameter
    }
}
