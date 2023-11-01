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
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var queue = [root]
        var maxFreq = 1
        var freqs = [Int: Int]()
        while let node = queue.popLast() {
            freqs[node.val, default: .zero] += 1
            maxFreq = max(maxFreq, freqs[node.val]!)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }

        return Array(freqs.filter { $0.value == maxFreq }.keys)
    }
}
