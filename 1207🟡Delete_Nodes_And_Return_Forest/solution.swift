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
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else {
            return []
        }

        var roots: [TreeNode] = []
        var toDelete = Set(to_delete)
        var queue: [(parent: TreeNode?, node: TreeNode)] = [(nil, root)]
        while let (parent, node) = queue.popLast() {
            if toDelete.remove(node.val) != nil {
                if parent?.left === node {
                    parent?.left = nil
                } else {
                    parent?.right = nil
                }

                if let left = node.left {
                    queue.append((nil, left))
                }

                if let right = node.right {
                    queue.append((nil, right))
                }
            } else {
                if parent == nil {
                    roots.append(node)
                }

                if let left = node.left {
                    queue.append((node, left))
                }

                if let right = node.right {
                    queue.append((node, right))
                }
            }
        }

        return roots
    }
}
