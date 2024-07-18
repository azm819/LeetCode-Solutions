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
    @discardableResult
    private func traverse(_ node: TreeNode?, _ distance: Int, _ result: inout Int) -> [Int] {
        var leafCounts = Array(repeating: Int.zero, count: distance + 1)

        guard let node = node else { return leafCounts }

        if node.left == nil && node.right == nil {
            leafCounts[0] = 1
        } else {
            let leftCounts = traverse(node.left, distance, &result)
            let rightCounts = traverse(node.right, distance, &result)

            for i in 0 ... distance {
                for j in 0 ... distance - i {
                    result += leftCounts[i] * rightCounts[j]
                }
            }

            for i in 0 ..< distance {
                leafCounts[i + 1] += leftCounts[i]
            }
            for j in 0 ..< distance {
                leafCounts[j + 1] += rightCounts[j]
            }
        }

        return leafCounts
    }

    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        guard distance >= 2 else { return .zero }
        var result: Int = .zero
        traverse(root, distance - 2, &result)
        return result
    }
}
