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
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }

        var levelSums = [Int]()
        var stack: [(node: TreeNode, level: Int)] = [(root, .zero)]
        while let (node, level) = stack.popLast() {
            while levelSums.count <= level {
                levelSums.append(.zero)
            }

            levelSums[level] += node.val
            if let left = node.left {
                stack.append((left, level + 1))
            }
            if let right = node.right {
                stack.append((right, level + 1))
            }
        }

        stack = [(root, .zero)]
        while let (node, level) = stack.popLast() {
            guard level < levelSums.count - 1 else {
                continue
            }

            let childrenValue = levelSums[level + 1] - (node.left?.val ?? .zero) - (node.right?.val ?? .zero)
            if let left = node.left {
                left.val = childrenValue
                stack.append((left, level + 1))
            }
            if let right = node.right {
                right.val = childrenValue
                stack.append((right, level + 1))
            }
        }

        root.val = .zero
        return root
    }
}
