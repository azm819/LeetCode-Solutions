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
    private func btsRange(_ root: TreeNode, _ result: inout Int) -> (Int, Int) {
        let leftR: Int
        if let left = root.left {
            let (lr, rr) = btsRange(left, &result)
            leftR = lr
            result = min(result, root.val - rr)
        } else {
            leftR = root.val
        }
        let rightR: Int
        if let right = root.right {
            let (lr, rr) = btsRange(right, &result)
            rightR = rr
            result = min(result, lr - root.val)
        } else {
            rightR = root.val
        }
        return (leftR, rightR)
    }

    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return .zero
        }
        var result: Int = .max
        btsRange(root, &result)
        return result
    }
}
