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
    func maxAncestorDiff(_ root: TreeNode?, _ minVal: Int? = nil, _ maxVal: Int? = nil) -> Int {
        guard let root = root else { return .zero }
        var result = 0
        var newMinVal = minVal ?? root.val
        if let minVal = minVal {
            result = max(result, abs(minVal - root.val))
            newMinVal = min(root.val, minVal)
        }
        var newMaxVal = maxVal ?? root.val
        if let maxVal = maxVal {
            result = max(result, abs(maxVal - root.val))
            newMaxVal = max(root.val, maxVal)
        }
        return max(
            result,
            maxAncestorDiff(root.left, newMinVal, newMaxVal),
            maxAncestorDiff(root.right, newMinVal, newMaxVal)
        )
    }
}
