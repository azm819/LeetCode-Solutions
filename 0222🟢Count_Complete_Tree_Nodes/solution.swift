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
    private func height(_ root: TreeNode?) -> Int {
        guard root != nil else { return .zero }
        return 1 + height(root?.left)
    }

    func countNodes(_ root: TreeNode?) -> Int {
        let treeHeight = height(root)
        guard treeHeight > 1 else { return treeHeight }
        var l = 1
        var r = 1 << (treeHeight - 1)
        while l < r {
            let c = (l + r + 1) / 2
            var subHeight = treeHeight - 1
            var nodesCount = c
            var curNode = root
            while subHeight > .zero {
                if nodesCount > (1 << (subHeight - 1)) {
                    curNode = curNode?.right
                    nodesCount -= (1 << (subHeight - 1))
                } else {
                    curNode = curNode?.left
                }
                subHeight -= 1
            }
            if curNode == nil {
                r = c - 1
            } else {
                l = c
            }
        }
        print(l)
        var res = 0
        for i in 0..<treeHeight - 1 {
            res += 1 << i
        }
        return res + l
    }
}

