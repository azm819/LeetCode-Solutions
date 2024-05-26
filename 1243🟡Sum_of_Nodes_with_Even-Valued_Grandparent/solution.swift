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
    func sumEvenGrandparent(_ root: TreeNode?, isGrandparentEven: Bool = false, isParentEven: Bool = false) -> Int {
        guard let root = root else { return .zero }

        var result = 0
        if isGrandparentEven {
            result += root.val
        }

        result += sumEvenGrandparent(root.left, isGrandparentEven: isParentEven, isParentEven: root.val % 2 == 0)
        result += sumEvenGrandparent(root.right, isGrandparentEven: isParentEven, isParentEven: root.val % 2 == 0)

        return result
    }
}
