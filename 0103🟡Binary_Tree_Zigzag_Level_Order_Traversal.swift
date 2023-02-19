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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[root]]
        var leftToRight = false
        while true {
            var res = [TreeNode]()
            for node in result.last!.reversed() {
                if leftToRight {
                    if let left = node.left {
                        res.append(left)
                    }
                    if let right = node.right {
                        res.append(right)
                    }
                } else {
                    if let right = node.right {
                        res.append(right)
                    }
                    if let left = node.left {
                        res.append(left)
                    }
                }
            }
            if res.isEmpty {
                break
            } else {
                result.append(res)
            }
            leftToRight.toggle()
        }
        return result.map { level in
            level.map { node in
                node.val
            }
        }
    }
}
