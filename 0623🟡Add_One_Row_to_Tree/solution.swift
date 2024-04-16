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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int, _ isLeft: Bool = true) -> TreeNode? {
        if depth == 1 {
            let node = TreeNode(val)
            if isLeft {
                node.left = root
            } else {
                node.right = root
            }
            return node
        } else {
            root?.left = addOneRow(root?.left, val, depth - 1, true)
            root?.right = addOneRow(root?.right, val, depth - 1, false)
            return root
        }
    }
}
