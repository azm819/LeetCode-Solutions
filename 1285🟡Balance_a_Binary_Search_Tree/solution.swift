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
    private func buildBalanceBST(_ l: Int, _ r: Int, _ values: [Int]) -> TreeNode? {
        guard l <= r else {
            return nil
        }

        let m = (l + r) / 2
        return TreeNode(values[m], buildBalanceBST(l, m - 1, values), buildBalanceBST(m + 1, r, values))
    }

    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var values = [Int]()
        var queue = [root]
        while let node = queue.popLast() {
            values.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        values.sort()

        return buildBalanceBST(.zero, values.count - 1, values)
    }
}
