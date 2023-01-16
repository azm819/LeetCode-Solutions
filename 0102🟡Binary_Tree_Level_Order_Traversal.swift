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
    private func levelOrder(_ root: TreeNode?, _ depth: Int, _ result: inout [[Int]]) {
        guard let root = root else { return }
        if depth == result.count {
            result.append([])
        }
        result[depth].append(root.val)
        levelOrder(root.left, depth + 1, &result)
        levelOrder(root.right, depth + 1, &result)
    }

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        levelOrder(root, 0, &result)
        return result
    }
}
