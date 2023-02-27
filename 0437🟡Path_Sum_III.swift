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
    func pathSum(_ root: TreeNode?, _ targetSum: Int, _ prevSums: [Int: Int] = [:]) -> Int {
        guard let root = root else { return .zero }
        var newSums: [Int: Int] = [:]
        for (sum, count) in prevSums {
            let newSum = sum + root.val
            newSums[newSum] = count
        }
        newSums[root.val] = newSums[root.val, default: .zero] + 1
        var result = 0
        result += newSums[targetSum, default: .zero]
        result += pathSum(root.left, targetSum, newSums)
        result += pathSum(root.right, targetSum, newSums)
        newSums.removeAll()
        return result
    }
}
