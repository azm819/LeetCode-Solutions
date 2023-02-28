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
    private func dfs(
        _ node: TreeNode?,
        _ memo: inout [String: (TreeNode, Int)]
    ) -> String {
        guard let node = node else { return "" }
        let repr = "(\(dfs(node.left, &memo)))\(node.val)(\(dfs(node.right, &memo)))"
        if let mem = memo[repr] {
            memo[repr] = (node, mem.1 + 1)
        } else {
            memo[repr] = (node, 1)
        }
        return repr
    }

    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var memo = [String: (TreeNode, Int)]()
        dfs(root, &memo)
        return memo.values.filter { $0.1 > 1 }.map { $0.0 }
    }
}
