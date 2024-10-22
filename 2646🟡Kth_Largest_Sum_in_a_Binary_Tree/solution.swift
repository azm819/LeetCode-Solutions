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
    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root else { return .zero }

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

        guard k <= levelSums.count else {
            return -1
        }

        levelSums.sort(by: >)
        return levelSums[k - 1]
    }
}
