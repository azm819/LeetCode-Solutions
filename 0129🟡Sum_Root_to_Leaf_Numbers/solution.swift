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
    func sumNumbers(_ root: TreeNode?, _ lastNum: Int = .zero) -> Int {
        guard let root = root else { return .zero }
        let curNum = lastNum * 10 + root.val
        if root.left != nil || root.right != nil {
            return sumNumbers(root.left, curNum) + sumNumbers(root.right, curNum)
        } else {
            return curNum
        }
    }
}
