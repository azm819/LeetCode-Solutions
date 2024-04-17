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
    private static let characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    func smallestFromLeaf(_ root: TreeNode?, _ current: String = "") -> String {
        guard let root = root else { return "" }

        let newCurrent = Solution.characters[root.val] + current
        var result: String?

        if let left = root.left {
            result = smallestFromLeaf(left, newCurrent)
        }

        if let right = root.right {
            let rightString = smallestFromLeaf(right, newCurrent)
            if let res = result {
                result = min(res, rightString)
            } else {
                result = rightString
            }
        }

        return result ?? newCurrent
    }
}
