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
    private let MAX_VALUE = 20_000

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return MAX_VALUE
        }
        let leftRes = kthSmallest(root.left, k)
        if leftRes < MAX_VALUE {
            return leftRes
        }
        let leftNodesCount = leftRes - MAX_VALUE
        let curK = k - leftNodesCount
        if curK == 1 {
            return root.val
        }
        let rightRes = kthSmallest(root.right, curK - 1)
        if rightRes < MAX_VALUE {
            return rightRes
        }
        let rightNodesCount = rightRes - MAX_VALUE
        return MAX_VALUE + leftNodesCount + 1 + rightNodesCount
    }
}
