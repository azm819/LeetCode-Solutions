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
    private func findBottomLeftValue(_ root: TreeNode, _ depth: Int) -> (value: Int, depth: Int) {
        switch (root.left, root.right) {
        case let (.some(left), .some(right)):
            let leftBottom = findBottomLeftValue(left, depth + 1)
            let rightBottom = findBottomLeftValue(right, depth + 1)
            return rightBottom.depth > leftBottom.depth ? rightBottom : leftBottom
        case let (.some(left), .none):
            return findBottomLeftValue(left, depth + 1)
        case let (.none, .some(right)):
            return findBottomLeftValue(right, depth + 1)
        case (.none, .none):
            return (root.val, depth)
        }
    }

    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else { fatalError() }
        return findBottomLeftValue(root, .zero).value
    }
}
