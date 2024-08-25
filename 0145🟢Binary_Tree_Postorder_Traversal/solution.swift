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
    private enum Visited {
        case left
        case right
    }

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var result = [Int]()
        var stack: [(TreeNode, Visited?)] = [(root, nil)]

        while let (node, visited) = stack.popLast() {
            switch visited {
            case .none:
                stack.append((node, .left))
                if let left = node.left {
                    stack.append((left, nil))
                }
            case .left:
                stack.append((node, .right))
                if let right = node.right {
                    stack.append((right, nil))
                }
            case .right:
                result.append(node.val)
            }
        }

        return result
    }
}
