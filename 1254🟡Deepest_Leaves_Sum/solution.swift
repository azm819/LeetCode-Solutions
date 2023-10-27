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
    private func dfs(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else { return (0, 0) }

        let (lV, lD) = dfs(root.left)
        let (rV, rD) = dfs(root.right)
        if lD == rD {
            return lD == 0 ? (root.val, 1) : (lV + rV, lD + 1)
        } else {
            return lD > rD ? (lV, lD + 1) : (rV, rD + 1)
        }
    }

    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        dfs(root).0
    }
}
