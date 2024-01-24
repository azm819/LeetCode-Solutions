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
    func pseudoPalindromicPaths(_ root: TreeNode?, _ counts: [Int] = Array(repeating: 0, count: 9)) -> Int {
        guard let root = root else { return .zero }
        var newCounts = counts
        newCounts[root.val - 1] += 1

        var hasChildren = false
        var result = 0
        if let left = root.left {
            hasChildren = true
            result += pseudoPalindromicPaths(left, newCounts)
        }
        if let right = root.right {
            hasChildren = true
            result += pseudoPalindromicPaths(right, newCounts)
        }

        if hasChildren {
            return result
        } else {
            var hasCenterElement = false
            for count in newCounts where count % 2 == 1 {
                if hasCenterElement {
                    return .zero
                }
                hasCenterElement = true
            }
            return 1
        }
    }
}
